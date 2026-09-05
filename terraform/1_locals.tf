locals {
  etiquetas_comunes = merge(
    {
      environment = var.environment
      workload    = "rag"
    },
    var.tags
  )
}
