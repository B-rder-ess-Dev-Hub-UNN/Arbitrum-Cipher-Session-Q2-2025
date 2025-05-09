// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract EvenMoreSolidity {
    // mappings
    mapping(address => uint) public balances;

    // 0xEmma  => 30
    // OxToch => 40

    function addAddressToBank(address _userAddress, uint _balance) public {
        balances[_userAddress] = _balance;
    }
}
