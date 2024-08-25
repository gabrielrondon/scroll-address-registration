// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressRegistry {
    // Mapping to store user addresses
    mapping(address => string) private addresses;

    // Events to be emitted on certain actions
    event AddressRegistered(address indexed user, string userAddress);
    event AddressUpdated(address indexed user, string newUserAddress);

    // Modifier to ensure only the owner of the address can modify it
    modifier onlyOwner() {
        require(bytes(addresses[msg.sender]).length > 0, "Address not registered");
        _;
    }

    // Function to register a new address
    function registerAddress(string memory userAddress) public {
        require(bytes(addresses[msg.sender]).length == 0, "Address already registered");
        addresses[msg.sender] = userAddress;
        emit AddressRegistered(msg.sender, userAddress);
    }

    // Function to update an existing address
    function updateAddress(string memory newUserAddress) public onlyOwner {
        addresses[msg.sender] = newUserAddress;
        emit AddressUpdated(msg.sender, newUserAddress);
    }

    // Function to retrieve the address associated with a user
    function getAddress(address user) public view returns (string memory) {
        return addresses[user];
    }
}
