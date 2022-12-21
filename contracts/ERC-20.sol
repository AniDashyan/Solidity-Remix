// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SmartContract
{
    string _name;
    string _symbol;

    mapping (address => uint) public balances;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
    function mint(address to, uint amount) public {
        balances[to] += amount;
    } 

    function transfer(address to, uint amount) public {
        require (balances[msg.sender] >= amount, "not enough balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    mapping (address => mapping (address => uint)) public allowances;

    function approve(address to, uint amount) public {
        allowances[msg.sender][to] += amount;
    }

    function checkBalance(address a) public view returns (uint) {
        return balances[a];
    }

    function checkAllowance(address owner, address spender) public view returns (uint) {
        return allowances[owner][spender];
    }

    function transferFrom(address from, address to, uint amount) public {
        require (allowances[from][msg.sender] >= amount, "not enough allowance");
        require (balances[from] >= amount, "not enough balance");
        balances[from] -= amount;
        balances[to] += amount;
        allowances[from][msg.sender] -= amount;
    }
}
