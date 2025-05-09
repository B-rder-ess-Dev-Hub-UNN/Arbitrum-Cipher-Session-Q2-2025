// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Arrays {
    uint[] public ages; // [] length = 0

    function add(uint _age) public {
        ages.push(_age);
    }

    function remove() public {
        ages.pop();
    }

    function getNumberOfAges() public view returns (uint) {
        return ages.length;
    }

    // [3, 2, 6, 8, 4]

    function getOldest() public view returns (uint) {
        uint maxAge = 0;
        uint i = 0;

        for (;;) {
            if (i > ages.length) {
                break;
            }

            if (maxAge < ages[i]) {
                maxAge = ages[i];
            }

            i++;
        }

        return maxAge;
    }
}
