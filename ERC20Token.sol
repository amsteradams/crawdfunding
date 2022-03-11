// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract ERC20Token is ERC20{
    constructor(uint initialSupply) ERC20('ALYRA', 'ALY'){
        _mint(msg.sender, initialSupply);
    }
}