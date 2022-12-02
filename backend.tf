terraform {
  cloud {
    organization = "morning-night-dream"

    workspaces {
      name = "${var.project_env}-platform"
    }
  }
}
