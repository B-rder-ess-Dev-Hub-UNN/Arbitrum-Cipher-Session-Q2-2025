// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MoreSolidity {
    uint public age = 5;

    // constants
    uint8 constant NUMBER_OF_CHAIRS_IN_HUB = 30;

    // immutables
    uint public immutable WEEKS;

    // diff btw constants and immutables
    // constants have to be initialized immediately they are declared
    // immutables have to be initialized inside the constructor function
    // both cannot be changed after they are initialized

    // special units in solidity
    uint public oneWei = 1 wei;
    uint public oneGwei = 1 gwei;
    uint256 public oneEther = 1 ether;
    uint public oneSecond = 1 seconds;
    uint public oneMinute = 1 minutes;

    uint public eth = 10e18; // 10 ^ 18 wei // not readable

    // if / else
    // bool - true or false
    function isEven(uint _number) public pure returns (string memory) {
        bool _isEven = _number % 2 == 0;

        if (_isEven) {
            return "even";
        } else {
            return "odd";
        }
    }

    // loops
    // break
    // continue
    function loopExample(uint n) public pure returns (uint) {
        uint total = 0;

        for (uint i = 0; i <= n; i = i + 1) {
            if (i == 50) {
                break;
            }

            if (i > 20) {
                total = 10;
                continue;
            }

            total = i;
        }

        // for (initialize_state ; set_condition ; at_the_end) {
        //  body_of_the_loop
        // }

        return total;
    }

    // mapping
    mapping(address => uint256) public balances;

    // arrays

    // function modifiers

    // constructor
    constructor(uint _nbWeeks) {
        WEEKS = _nbWeeks;
    }
}
