// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract AdvancedSolidity {
    // enums
    enum Status {
        Pending,
        Accepted,
        Canceled
    }

    // structs
    // struct Order {
    //     address customer;  /// the one that placed it
    //     uint256 orderValue;   /// amount
    //     Status status;         /// current status
    //     uint256 total_price;     /// sum of all items price
    //     uint256 timestamp; /// timestamp of the order
    // }

    Status public status = Status.Pending;

    // sending  eth in smart contract
    function sendEth(uint256 _amount, address payable  _receiver) public {
        require(_amount > 0, "Amount must be greater than 0");
        
        (bool sent, bytes memory data) = _receiver.call{value: _amount}("");

        require(sent, "");
    }

    // receiving eth in smart contract
    receive() external payable { 
        require (address(this).balance > 0, "");
        /// not require(_amount == msg.data[0]);
        status = Status.Accepted;
    }


    // setup hardhat
    // deploy a contract in hardhat testnet
}
