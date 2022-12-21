// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.12;

/* contract    New 
{
    address public immutable owner;
    uint256 public constant ownerBalance = 1000000;

    constructor()
    {
        owner = msg.sender;
    }
} */

// Exaqmple
/* constructor (address a)
{

} */

contract    MyContract 
{
    mapping (address => uint256) public balances;
    // uint256 public                      someNumber1 = 1 ether; // = 10^18
    // uint256 public                      someNumber2 = 1e18; // = 10^18
    // uint256 public                      time1 = 1 minutes;
    // uint256 public                      time2 = 1 hours;
    // uint256 public                      time3 = 1 days;

    function    getEther() public payable {}

    function    getContractBalance() public view returns (uint256)
    {
        return address(this).balance;
    }
    function    deposit() public payable
    {
        balances[msg.sender] += msg.value;
    } 

    function    withdraw(uint256 amount) public
    {
    
    }
}