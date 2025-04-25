/**
 * @title Calculator
 * @dev A simple calculator contract for basic arithmetic operations.
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    // Adds two numbers and returns the result
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Subtracts the second number from the first and returns the result
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        require(a >= b, "Result would be negative");
        return a - b;
    }

    // Multiplies two numbers and returns the result
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    // Divides the first number by the second and returns the result
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b > 0, "Division by zero");
        return a / b;
    }
}    // State variable to store the last result
    uint256 public lastResult;

    // Stores a result in the state variable
    function storeResult(uint256 result) public {
        lastResult = result;
    }

    // Returns the last stored result
    function getLastResult() public view returns (uint256) {
        return lastResult;
    }
}
