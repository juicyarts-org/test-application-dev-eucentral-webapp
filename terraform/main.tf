// Create Resource Group
// how to associate ressource group with subscription?
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

// Create Static Web App
resource "azurerm_static_site" "web" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

// Instrumentation?

