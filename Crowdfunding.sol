// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.12;

import "./ERC20Token.sol";

contract Crowdsale{
    uint rate = 200;
    ERC20Token public token;
    uint decimal = 10 ** 18;
    /*
    *Initialize our ERC20 token with initial supply for our Crowdsale's contract
    */
    constructor(uint initialSupply){
        token = new ERC20Token(initialSupply);
        
    }

    /*
    *People cannot purchasse for less than 0.1 ether
    */
    receive() external payable{
        require(msg.value >= 0.1 ether, "You cannot purchasse less than 0.1 eth");
        distribute(msg.value);
    }

    function distribute(uint256 amount) internal{
        uint tokenToTransfer = amount * rate;
        token.transfer(msg.sender, tokenToTransfer);
    }
    
    function getMyBalance()view public returns(uint){
        return token.balanceOf(msg.sender) / decimal;
    }

    /*
    *Get the amount of tokens left on this contract
    */
    function getTokensLeft()view external returns(uint){
        return token.balanceOf(address(this)) / decimal;
    }

    /*
    *Get the amount of ether sent on this contract
    */
    function getContractBalance()view external returns(uint){
        return address(this).balance / decimal;
    }

}