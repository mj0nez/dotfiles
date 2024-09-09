plugin "docker" {
  config {
    allow_privileged = true

    volumes {
      enabled = true
    }
    
    gc {
      image       = false
    //   image_delay = "3m"
    //   container   = true
    }
    // extra_labels = ["job_name", "task_group_name", "task_name", "namespace", "node_name"]
  }
}

telemetry {
  publish_allocation_metrics = true
  publish_node_metrics       = true
  prometheus_metrics         = true
}
