// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Calculator{
    //initialise the result variable
    uint256 public result;

 //store result
   function storeResult(uint256 _result) public {
        result = _result;
    }

//gets the result
    function getResult() public view returns (uint256) {
       return result;
    }
//add the result
    function add( uint256 a, uint256 b) public  returns(uint256){
         result = a + b;
        return result;
    }
//subtract the result
    function subtract( uint256 a, uint256 b) public  returns (uint256){
         result = a-b;
        return result;
    }
//multiply the result
    function multiply(uint256 a, uint256 b) public  returns (uint256){
         result = a*b;
        return result;
    }
//divide the result
    function divide (uint256 a, uint256 b) public  returns (uint256) {
        result =  a/b;
        return result;
    }
}
