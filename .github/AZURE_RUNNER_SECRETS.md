Azure service principal and GitHub secrets required for workflow-runner auth (OIDC)

Required GitHub repository secrets
- AZURE_CLIENT_ID : the application (client) id of the service principal / app registration
- AZURE_TENANT_ID : the Entra/Microsoft Entra (tenant) id
- AZURE_SUBSCRIPTION_ID : target Azure subscription id
- GH_ACCESS_TOKEN : a GitHub personal access token used by workflows when referenced (if used)

No client secret is required. Auth uses OpenID Connect (OIDC) federated credentials, so there is
nothing to rotate or leak.

Notes
- The workflows mirror values into ARM_CLIENT_ID, ARM_TENANT_ID and ARM_SUBSCRIPTION_ID, and set
  ARM_USE_OIDC=true, so Terraform's azurerm provider authenticates via OIDC too.
- The `azure/login@v2` action and the Terraform azurerm provider both rely on the job permission
  `id-token: write`, which lets GitHub Actions mint a short-lived OIDC token for the run.
- Never commit secrets to source control. Add them through GitHub repository Settings → Secrets → Actions or via `gh secret`.

Create the app registration / service principal (examples)
1) Login as an interactive user in your environment:

```bash
az login
az account set --subscription "$SUBSCRIPTION_ID"
```

2) Create a service principal scoped to the subscription (least-privilege: consider scoping to a resource group instead of the full subscription):

```bash
az ad sp create-for-rbac \
  --name "github-actions-sp-<repo>" \
  --role "Contributor" \
  --scopes "/subscriptions/$SUBSCRIPTION_ID"
```

Capture the values:
```bash
CLIENT_ID=$(az ad sp list --display-name "github-actions-sp-<repo>" --query "[0].appId" -o tsv)
TENANT_ID=$(az account show --query tenantId -o tsv)
SUBSCRIPTION_ID=$(az account show --query id -o tsv)
```

3) Add a federated credential trusting the repository/branch (no client secret is created):

```bash
az ad app federated-credential create \
  --id "$CLIENT_ID" \
  --parameters '{
    "name": "github-oidc-main",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:soysoliscarlos/dojogiraveraguas2026:ref:refs/heads/main",
    "audiences": ["api://AzureADTokenExchange"]
  }'
```

Add secrets to GitHub (examples)
- Using the GitHub web UI: Repository → Settings → Secrets and variables → Actions → New repository secret. Add `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, and `GH_ACCESS_TOKEN` (if needed by your workflows).

- Using `gh` CLI (recommended for automation):

```bash
# set secrets for repo owner/repo
gh secret set AZURE_CLIENT_ID --body "$CLIENT_ID" --repo OWNER/REPO
gh secret set AZURE_TENANT_ID --body "$TENANT_ID" --repo OWNER/REPO
gh secret set AZURE_SUBSCRIPTION_ID --body "$SUBSCRIPTION_ID" --repo OWNER/REPO
```

Triggering the deployment workflow from the GitHub UI
- Go to the repository Actions tab → select "Infrastructure Deployment" workflow → Run workflow → choose branch `main` and any inputs, then Run workflow.
- The federated credential only trusts `refs/heads/main`, so plan/apply/destroy only work from that branch.

Security recommendations
- Prefer scoping the service principal to the minimal resource group, not the whole subscription.
- Grant only the permissions your Terraform needs (for example `Contributor` on a resource group instead of subscription-wide).
- If AZURE_CLIENT_SECRET was previously used, delete it from GitHub repo secrets after confirming OIDC works.

If you want, I can:
- Provide a script to create the SP with least-privilege for a specific resource group.
- Add federated credentials for additional branches/environments.
