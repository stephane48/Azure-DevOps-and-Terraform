# Configure the Microsoft Azure Provider
provider "azurerm" {
  version = "=2.5.0"  
  features {}
}

# Create a backend to store the tfstate file, we store it in a container
# created under a storage account on azure
terraform {
    backend "azurerm" {
        resource_group_name  = "tf_rd_blobstore"
        storage_account_name = "tfstorageaccountstephane"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}

# Create the variable for the tag of our docker image
variable "imagebuild" {
  type        = string
  description = "Latest Image Build"
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
    name            = "weatherapi"
    image           = "stephane48/weatherapi:${var.imagebuild}" 
        cpu         = "1"
        memory      = "1"

        ports {
            port     = 80
            protocol = "TCP"
        }
  }
}
