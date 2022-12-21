// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// ERC20(_name, _symbol)
contract Burunduk is ERC20("Burunduk", "BT") {
    function mint() public
    {
        _mint(msg.sender, 10 ** 18);
    }
}