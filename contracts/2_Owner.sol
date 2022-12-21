// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.12;

contract Owner
{
    address public      owner; // state
    uint256 private     ownerBalance; // 0 // state
    uint256[10] public  arr;
    uint256             c;

    constructor(address _owner, uint256 _balance)
    {
        owner = _owner;
        ownerBalance = _balance;
    }

    function    addBalance(uint256 newBalance) public returns (uint256)
    {
        ownerBalance += newBalance;
        return (ownerBalance);
    } 

    function    some() public pure returns (string memory)
    {
        string memory lastname = "Hello";
        // uint256[] memory array = new uint256[](10);
        return (lastname);
    }

    function    add(uint256 a, uint256 b) public pure returns (uint256)
    {
        return (a + b);
    }

    function getOwner() public view returns (address)
    {
        return (owner);
    }

    function setC() public
    {
        c = add(100, 200);
        // c = 100 + 200;
    }
}