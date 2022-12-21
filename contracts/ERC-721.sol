// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 < 0.9.0;

contract ERC_721 {
    string _name;
    string _symbol;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    mapping(address => uint) public balances;
    mapping(uint => address) public owners;

    function mint(address to, uint id) public {
       balances[to] += 1;
       owners[id] = to;
    }

    function balanceOf(address _owner) public view returns (uint) {
        return balances[_owner]; 
    }

    function ownerOf(uint id) public view returns (address) {
        return owners[id];
    }

    function transfer(address to, uint id) public {
        require(ownerOf(id) == msg.sender, "Not the owner of ID");
        balances[msg.sender] -= 1;
        balances[to] += 1;
        owners[id] = to;
    }
    
    mapping(address => mapping(address => bool)) public allowancesForAll;
    mapping(uint => address) public allowances;

    function approve(address to, uint id) public {
        require(ownerOf(id) == msg.sender, "Not the owner");
        allowances[id] = to;
    }

    function approveAll(address to, uint id) public {
        require(ownerOf(id) == msg.sender, "Not the owner");
        allowancesForAll[msg.sender][to] = true;
    }

    function transferFrom(address from, address to, uint id) public {
        require(ownerOf(id) == from, "Not the owner");
        require(allowances[id] == msg.sender || allowancesForAll[from][msg.sender] == true, "No allowance");
        balances[from] -= 1;
        balances[to] += 1;
        if (allowances[id] == msg.sender)
            delete allowances[id];
        owners[id] = to;
    }
}
