 // SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract calulator {
uint8 public Result;

//function to perform additions
function add (uint8 a, uint8 b)public pure returns (uint){
    return a + b;
}
// function for subtractions
function subtract (uint8 a, uint8 b)public pure returns (uint){
   require(b != 0);
    return a - b;
}
//function for multiplication
function multiply(uint a, uint b)public pure returns (uint){
    return a * b;
}
// function for division
function divide(uint a, uint b)public pure returns (uint){
   require(b != 0);
    return a / b;
}
// function to store result in state variables
function storeResult(uint8)public {
    Result = Result;
}
//function to get result
function getLastResult()public view returns  (uint8){
    return Result;
}
}