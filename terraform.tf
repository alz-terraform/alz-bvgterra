terraform {
  required_version = "~> 1.6"
  required_providers {
    azurerm = "~> 3.88"
  }
  backend "azurerm" {
    storage_account_name = "stoalzbvgterrager001jzrf"
    container_name       = "bvgterra-tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    subscription_id      = "6d87c7b7-b73c-42a5-b979-628239b936e3"
    tenant_id            = "c1debd98-c481-4e51-b286-f6eda8fcea48"

  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  skip_provider_registration = true
  alias                      = "management"
  subscription_id            = var.subscription_id_management
  features {}
}

provider "azurerm" {
  skip_provider_registration = true
  alias                      = "connectivity"
  subscription_id            = var.subscription_id_connectivity
  features {}
}

provider "azurerm" {
  alias           = "identity"
  subscription_id = var.subscription_id_identity
  features {}
}
