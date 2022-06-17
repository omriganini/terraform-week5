# Commands and configuration in Terraform

First of all we will install pycharm or vs code one of them will be our ide, after that we have to open a new folder and to create
our configuration files for with the end of ".tf" it will make them terraform files.
First we will set the providers.tf file

# Azure Provider source and version being used
```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

```
## Configure the project
We will follow those instructions:

![week-4-project-env](https://user-images.githubusercontent.com/105926044/174308223-c7dfc3b6-fc55-4d64-ab8d-ba64f12337c1.png)


## Create Resource Group
```


resource "azurerm_resource_group" "terraform-project" {
  name     = "Web-app-terraform"
  location = "australiaeast"
  }
}
```

## Build your infrastructure
After we configure the resource group we will build the infrastructure as required before.

## our first command to initialize the providers environment will be:
```
terraform init 
```
## than we will check the code with:
```
terraform plan
```
## after we check its legit we will apply with:
```
terraform apply
```
## after we finish all the steps we will destroy everything and delete from the cloud with:
```
terraform destroy
