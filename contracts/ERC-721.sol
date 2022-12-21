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
        require(balances[ownerOf(id)] != 0, "Not enough balance");
        balances[ownerOf(id)] -= 1;
        balances[to] += 1;
        owners[id] = to;
    }

    mapping (address => mapping(address => uint)) public allowances;

    function approve(address to, uint id) public {
        require(ownerOf(id) == msg.sender, "Not the owner of ID");
        allowances[ownerOf(id)][to] += 1;
        owners[id] = to;
    }

    function transferFrom(address from, address to, uint id) public {
        require(ownerOf(id) == msg.sender, "Not the owner");
        require(balanceOf(from) != 0, "Not enough balance");
        balances[from] -= 1;
        balances[to] += 1;
        allowances[from][ownerOf(id)] -= 1;
        owners[id] = to;
    }
}
