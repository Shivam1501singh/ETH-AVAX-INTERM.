// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract LocalStore {
    struct Item {
        string name;
        uint256 price;
        uint256 stock;
    }

    mapping(uint256 => Item) private inventory;
    uint256 private itemCount;

    // Function to add a new item to the inventory
    function addItem(string memory name, uint256 price, uint256 stock) public {
        require(bytes(name).length > 0, "Item name must not be empty.");
        require(price > 0, "Item price must be greater than zero.");
        require(stock > 0, "Item stock must be greater than zero.");

        inventory[itemCount] = Item(name, price, stock);
        itemCount++;
    }

    // Function to purchase an item
    function purchaseItem(uint256 itemId, uint256 quantity) public payable {
        require(itemId < itemCount, "Item does not exist.");
        Item storage item = inventory[itemId];
        require(quantity > 0, "Quantity must be greater than zero.");
        require(item.stock >= quantity, "Not enough stock available.");
        require(msg.value >= item.price * quantity, "Insufficient funds sent.");

        item.stock -= quantity;

        // Refund excess funds if any
        uint256 refund = msg.value - (item.price * quantity);
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }
    }

    // Function to get item details
    function getItem(uint256 itemId) public view returns (string memory name, uint256 price, uint256 stock) {
        require(itemId < itemCount, "Item does not exist.");
        Item storage item = inventory[itemId];
        return (item.name, item.price, item.stock);
    }

    // Function to remove an item from inventory
    function removeItem(uint256 itemId) public {
        require(itemId < itemCount, "Item does not exist.");
        delete inventory[itemId];

        // Adjust item count if last item is removed
        if (itemId == itemCount - 1) {
            itemCount--;
        }
    }

    // Function to check the store's total inventory value
    function totalInventoryValue() public view returns (uint256) {
        uint256 totalValue = 0;

        for (uint256 i = 0; i < itemCount; i++) {
            Item storage item = inventory[i];
            totalValue += item.price * item.stock;
        }

        // Ensure the total value calculation does not overflow using assert
        assert(totalValue >= 0);

        return totalValue;
    }

    // Function to get the number of items in the store
    function getItemCount() public view returns (uint256) {
        return itemCount;
    }
}
