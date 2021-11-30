# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgsentinel-management" {
  name     = "rg-sentinel-management"
  location = "uksouth"
}


resource "azurerm_log_analytics_workspace" "rgsentinel-management-la" {
  name                = "la-example-utv-weu"
  location            = "${azurerm_resource_group.rgsentinel-management.location}"
 resource_group_name = "${azurerm_resource_group.rgsentinel-management.name}"
  sku                 = "PerGB2018"
  retention_in_days   = 90
}

resource "azurerm_log_analytics_solution" "la-opf-solution-sentinel" {
  solution_name         = "SecurityInsights"
  location              = "${azurerm_resource_group.rgsentinel-management.location}"
  resource_group_name   = "${azurerm_resource_group.rgsentinel-management.name}"
  workspace_resource_id = "${azurerm_log_analytics_workspace.rgsentinel-management-la.id}"
  workspace_name        = "${azurerm_log_analytics_workspace.rgsentinel-management-la.name}"
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
}