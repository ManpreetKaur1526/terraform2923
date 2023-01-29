resource "azurerm_resource_group" "example" {
  name     = "TS-Dev-App-diskrg"
  location = "East US"
}

resource "azurerm_managed_disk" "example" {
  count = length()
  name                 = "acctestmd"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "staging"
  }
}