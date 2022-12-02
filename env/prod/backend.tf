terraform {
  cloud {
    organization = "morning-night-dream"

    workspaces {
      name = "prod-platform"
    }
  }
}
