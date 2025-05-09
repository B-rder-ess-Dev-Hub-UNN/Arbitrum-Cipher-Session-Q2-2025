// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// function modifiers

contract SimpleStorage {
    // declare state
    uint public storedData;
    address private owner;

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("Must be contract owner");
        }
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // function to update
    function update(uint a) public onlyOwner {
        storedData = a;
    }

    // function to get state
    function get() public view returns (uint) {
        return storedData;
    }
}
