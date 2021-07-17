resource "azurerm_resource_group" "TerraRG" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "TerraVNET" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.TerraRG.location}"
  resource_group_name = "${azurerm_resource_group.TerraRG.name}"
}

resource "azurerm_subnet" "TerraSUB" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.TerraRG.name}"
  virtual_network_name = "${azurerm_virtual_network.TerraVNET.name}"
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "TerraVMNic" {
  name                = "${var.prefix}-nic"
  location            = "${azurerm_resource_group.TerraRG.location}"
  resource_group_name = "${azurerm_resource_group.TerraRG.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.TerraSUB.id}"
    private_ip_address_allocation = "Dynamic"
  }
}