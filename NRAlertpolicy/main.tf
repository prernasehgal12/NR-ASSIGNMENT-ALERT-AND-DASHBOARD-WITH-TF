resource "newrelic_alert_policy" "host_policy" {
  name = var.my_policy
}

resource "newrelic_nrql_alert_condition" "host_conditons" {
  count = length(var.conditions)
  account_id = var.account_id
  policy_id = newrelic_alert_policy.host_policy.id
  type = var.type
  name = "host_conditions-${var.conditions[count.index].name}"
  enabled = var.enabled

  nrql {
    query = var.conditions[count.index].query
  }

  critical {
    operator = var.critical_operator
    threshold = var.conditions[count.index].name == "CPU" ? var.threshold_critical_CPU : var.threshold_critical_Memory
    threshold_duration = var.threshold_duration_critical
    threshold_occurrences = var.threshold_occurences_critical
  }

  warning {
    operator = var.warning_operator
    threshold = var.conditions[count.index].name == "CPU" ? var.threshold_warning_CPU : var.threshold_warning_Memory
    threshold_duration = var.threshold_duration_warning
    threshold_occurrences = var.threshold_occurences_warning
  }
}