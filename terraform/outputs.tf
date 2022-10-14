output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "static_web_app_name" {
  value = azurerm_static_site.web.name
}
