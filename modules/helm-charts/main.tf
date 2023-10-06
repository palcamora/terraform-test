resource "helm_release" "releases" {
    count = length(var.charts) # With this I create a loop resource for each chart

    name       = var.charts[count.index].chart_name
    namespace  = var.charts[count.index].chart_namespace
    repository = var.charts[count.index].chart_repository
    chart      = var.charts[count.index].chart_name
    version    = var.charts[count.index].chart_version

# With "dyanmic" I can create several blocks inside a resource
    dynamic "set" {
        for_each = var.charts[count.index].values
        content {
            name  = set.value.name
            value = set.value.value
        }
    }

    dynamic "set_sensitive" {
        for_each = var.charts[count.index].sensitive_values
        content {
            name  = set_sensitive.value.name
            value = set_sensitive.value.value
        }
    }
}