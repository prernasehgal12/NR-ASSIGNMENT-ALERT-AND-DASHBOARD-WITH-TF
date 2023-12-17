variable "account_id" {
  type = string
}

variable "api_key" {
  type = string
}

variable "region" {
  type = string
}

variable "my_policy" {
  type = string
}

variable "conditions" {
  default = [
    {name = "CPU", query = "SELECT average(cpuPercent) FROM SystemSample FACET hostname"},
    {name = "Memory", query = "SELECT average(memoryUsedBytes) FROM SystemSample FACET hostname"}
  ]
}

variable "threshold_duration_critical" {
  type = number
}

variable "threshold_duration_warning" {
  type = number
}

variable "threshold_occurences_critical" {
  type = string
}

variable "threshold_occurences_warning" {
  type = string
}

variable "enabled" {
  type = bool
}

variable "type" {
  type = string
}

variable "warning_operator" {
  type = string
}

variable "critical_operator" {
  type = string
}

variable "threshold_critical_CPU" {
  type = number
}

variable "threshold_warning_CPU" {
  type = number
}

variable "threshold_critical_Memory" {
  type = number
}

variable "threshold_warning_Memory" {
  
}