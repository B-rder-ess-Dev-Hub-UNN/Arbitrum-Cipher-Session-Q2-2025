//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Calculator{
    uint256 public Result;

  //This is a fuction to perform addition//
    function add(uint256 a, uint256 b) public pure returns(uint256){
        return a + b;
    }

//this is a fuction to subtract values//
    function subtract(uint256 a , uint256 b) public pure returns(uint256){
        require(b <= a, "cannot subtract");
        return a - b;
    }

 //This is a function to multiply values//
    function multiply(uint256 a, uint256  b) public pure returns(uint256){
        return a * b;
    }

  //this is a function to divide values  
    function divide(uint256 a, uint256 b) public pure returns(uint256){
        return a / b;

    }
 //this is a fuction that stores the results of values gotten//
    function storeResult(uint256 _inputResult) public {
        Result = _inputResult;
    }

//this is a function to get the last updated result stored//
    function getLastResult() public view returns(uint){        
        return Result; }
}