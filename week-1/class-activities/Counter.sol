// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Counter {
    uint public number;

    // local
    // state
    // global

    // get
    function get() public view returns (uint) {
        return number;
    }

    // get caller
    function getCaller() public view returns (address) {
        return msg.sender;
    }

    // increase
    function increase() public returns (uint) {
        number = number + 1;
        return number;
    }

    // decrease
    function decrease() public returns (uint) {
        number = number - 1;
        return number;
    }

    // increaseBy
    function increaseBy(uint _number) public {
        int nine = 9;
        number = number + _number;
    }

    // decreaseBy
    function decreaseBy(uint _number) public {
        number = number - _number;
    }
}
