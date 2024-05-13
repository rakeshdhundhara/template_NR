
resource "newrelic_one_dashboard" "dashboard_04" {
  for_each    = var.dashboard
  name        = each.value.name
  permissions = each.value.permissions
  page {
    name = each.value.pagename
    dynamic "widget_pie" {
      for_each = each.value.pie
      iterator = widget
      content {
        title  = widget.value.title
        row    = widget.value.row
        column = widget.value.column
        height = widget.value.height
        width  = widget.value.width
        nrql_query {
          query = widget.value.query
        }

      }
    }
    dynamic "widget_bar" {
      for_each = each.value.bar
      iterator = widget
      content {
        title  = widget.value.title
        row    = widget.value.row
        column = widget.value.column
        height = widget.value.height
        width  = widget.value.width
        nrql_query {
          query = widget.value.query
        }
      }

    }
  }
  dynamic "variable" {
    for_each = each.value.variable
    iterator = template
    content {
      default_values     = template.value.default_values
      is_multi_selection = template.value.is_multi_selection
      title              = template.value.title
      name               = template.value.name
      nrql_query {
        account_ids = [template.value.account_id]
        query       = template.value.query
      }
      replacement_strategy = template.value.replacement_strategy
      type                 = template.value.type
    }
  }

}


