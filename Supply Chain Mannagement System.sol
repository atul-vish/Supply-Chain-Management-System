// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChainManagement {
    struct Product {
        uint id;
        string name;
        string currentOwner;
        string status;
    }

    mapping(uint => Product) public products;
    uint public productCount = 0;

    function addProduct(string memory _name, string memory _owner) public {
        productCount++;
        products[productCount] = Product(productCount, _name, _owner, "Created");
    }

    function updateProduct(uint _id, string memory _newOwner, string memory _newStatus) public {
        require(_id > 0 && _id <= productCount, "Invalid product ID");
        Product storage product = products[_id];
        product.currentOwner = _newOwner;
        product.status = _newStatus;
    }

    function getProduct(uint _id) public view returns (uint, string memory, string memory, string memory) {
        require(_id > 0 && _id <= productCount, "Invalid product ID");
        Product memory product = products[_id];
        return (product.id, product.name, product.currentOwner, product.status);
    }
}

