// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol"; // Import the ERC20 interface

contract TokenEarningContract {
    address public owner; // Address of the contract owner
    IERC20 public token;  // Address of the ERC20 token

    constructor(address _tokenAddress) {
        owner = msg.sender;
        token = IERC20(_tokenAddress);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Earn tokens function
    function earnTokens(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");

        // Transfer tokens to the caller
        token.transfer(msg.sender, amount);
    }

    // Send tokens to a specified address
    function sendTokens(address recipient, uint256 amount) external onlyOwner {
        require(recipient != address(0), "Invalid recipient address");
        require(amount > 0, "Amount must be greater than 0");

        // Transfer tokens to the specified address
        token;transfer(recipient, amount);
    }
}
