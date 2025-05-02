// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract calculator {
    uint256 public result;

    function add(uint a, uint b ) public returns (uint){
    result = a + b;
    return result;
    }

     function substract(uint a, uint b ) public returns (uint){
    result = a - b;
    return result;
    }

     function multiply(uint a, uint b ) public returns (uint){
    result = a * b;
    return result;
    }

     function divide(uint a, uint b ) public returns (uint){ 
     require (b != 0, 'cannot be divide by zero' );
     result = a / b;
    return result;
    }

    function storeResult(uint _answer)public {
    result = _answer;
    }

    function getLastResult()public view returns  (uint){
    return result;
    }
}

    