// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Token {
    address public owner;

    string public name = "Continential";
    string public symbol = "CON";
    uint256 public totalSupply = 0;

    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        balances[msg.sender]= totalSupply;
    }

    function mint(address account, uint256 amount) public {
        require(account == owner, "Only the owner can call this function");
        totalSupply += amount;
        balances[account] += amount;
    }

    function burn(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        totalSupply -= amount;
        balances[msg.sender] -= amount;
    }

    function transfer(address recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
