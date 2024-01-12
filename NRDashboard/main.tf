resource "newrelic_one_dashboard" "host_dashboard" {
  name = "Host_Dashboard"
  permissions = var.permissions

  page {
    name = "Page 1"

    widget_bar {
      title  = "Overall CPU % Statistics"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "SELECT average(cpuSystemPercent), average(cpuUserPercent), average(cpuIdlePercent), average(cpuIOWaitPercent) FROM SystemSample SINCE 1 hour ago TIMESERIES"
      }
    }

    widget_bar {
      title = "Memory Usage"
      row = 1
      column = 7
      width = 6
      height = 3

      nrql_query {
        query = "SELECT average(host.memoryUsedPercent) AS 'Memory used %' FROM Metric WHERE `entityGuid` = 'NDI2NzI3M3xJTkZSQXxOQXw2Mjc0ODI0MTQzMzk2NTE4ODI0' TIMESERIES auto"
      }
    }
    widget_bar {
      title  = "Overall CPU % Statistics"
      row    = 2
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT average(cpuSystemPercent), average(cpuUserPercent), average(cpuIdlePercent), average(cpuIOWaitPercent) FROM SystemSample SINCE 1 hour ago TIMESERIES"
      }
    }


  }

  page {
    name = "Page 2"

    widget_billboard {
      title = "Api Call"
      row = 1
      column = 1
      width = 5
      height = 5

      nrql_query {
        query = "SELECT count(*) FROM Public_APICall"
      }
    }
  }
}