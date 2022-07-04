# Configure the Microsoft Azure Provider
provider "azurerm" {
  version = "=2.5.0"  
  features {}
}

# Create resource group in Azure
resource "azurerm_resource_group" "tf_test" {
  name = "tfminrg"
  location = "East US"
}

# Create a container resource
resource "azurerm_container_group" "tfcg_test" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.tf_test.location
  resource_group_name       = azurerm_resource_group.tf_test.name

  ip_address_type   = "public"
  dns_name_label    = "stephane48wa"
  os_type           = "Linux" 

  container {
    name = "weatherapi"
    image   = "stephane48/weatherapi" 
        cpu     = "1"
        memory = "1"

        ports {
            port     = 80
            protocol = "TCP"
        }
  }
}
