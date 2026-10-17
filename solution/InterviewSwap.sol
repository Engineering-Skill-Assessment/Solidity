// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @dev Interviewer answer key for the 10-minute screen.
library InterviewSwap {
    uint256 internal constant BPS = 10_000;

    error InsufficientLiquidity();
    error InsufficientInput();
    error InvalidFee();

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut,
        uint256 feeBps
    ) internal pure returns (uint256 amountOut) {
        if (amountIn == 0) revert InsufficientInput();
        if (reserveIn == 0 || reserveOut == 0) revert InsufficientLiquidity();
        if (feeBps >= BPS) revert InvalidFee();

        uint256 amountInWithFee = amountIn * (BPS - feeBps);
        amountOut = (amountInWithFee * reserveOut) / (reserveIn * BPS + amountInWithFee);
    }
}
