# The terraform {} block contains Terraform settings, including the required providers Terraform will use to provision your infrastructure. 
# For each provider, the source attribute defines an optional hostname, a namespace, and the provider type. Terraform installs providers from the Terraform Registry by default. 
# In this example configuration, the azurerm provider's source is defined as hashicorp/azurerm, which is shorthand for registry.terraform.io/hashicorp/azurerm.

# You can also define a version constraint for each provider in the required_providers block. 
# The version attribute is optional, but we recommend using it to enforce the provider version. 
# Without it, Terraform will always use the latest version of the provider, which may introduce breaking changes.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  cloud {
    organization = "JakeF191"
    workspaces {
      name = "learn-terraform-azure"
    }
  }

  required_version = ">= 1.1.0"
}

# The provider block configures the specified provider, in this case azurerm. A provider is a plugin that Terraform uses to create and manage your resources. 
# You can define multiple provider blocks in a Terraform configuration to manage resources from different providers.
provider "azurerm" {
  features {}
}

# Use resource blocks to define components of your infrastructure. A resource might be a physical component such as a server, or it can be a logical resource such as a Heroku application.

# Resource blocks have two strings before the block: the resource type and the resource name. In this example, the resource type is azurerm_resource_group and the name is rg. 
# The prefix of the type maps to the name of the provider. In the example configuration, Terraform manages the azurerm_resource_group resource with the azurerm provider. 
# Together, the resource type and resource name form a unique ID for the resource. For example, the ID for your network is azurerm_resource_group.rg.
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "uksouth"

    tags = {
    Environment = "Dev"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}