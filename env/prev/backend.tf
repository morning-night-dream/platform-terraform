terraform {
  cloud {
    organization = "morning-night-dream"

    workspaces {
      name = "prev-platform"
    }
  }
}
