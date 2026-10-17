// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// @title InterviewBugs (verbal, ~3 minutes)
/// @notice Intentionally broken. Candidate names issues out loud — no need to fix in the interview.
contract InterviewBugs {
    IERC20 public immutable token;
    mapping(address => uint256) public balances;
    address public owner;

    constructor(address token_) {
        token = IERC20(token_);
        owner = msg.sender;
    }

    function deposit(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "bal");
        token.transfer(msg.sender, amount); // external call before state update
        balances[msg.sender] -= amount;
    }

    function setOwner(address newOwner) external {
        owner = newOwner; // missing access control
    }
}
