terraform {
  backend "remote" {
    organization = "[org-name]"

    workspaces {
      name = "[workspace-name]"
    }
  }
}
