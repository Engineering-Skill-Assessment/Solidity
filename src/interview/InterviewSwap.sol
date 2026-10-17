// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title InterviewSwap (10-minute screen)
/// @notice Implement ONLY `getAmountOut`. Formula is given — show you can code it safely.
library InterviewSwap {
    uint256 internal constant BPS = 10_000;

    error InsufficientLiquidity();
    error InsufficientInput();
    error InvalidFee();
    error NotImplemented();

    /// @dev Constant-product swap with fee in basis points.
    ///
    ///   amountInWithFee = amountIn * (BPS - feeBps)
    ///   amountOut       = (amountInWithFee * reserveOut)
    ///                   / (reserveIn * BPS + amountInWithFee)
    ///
    /// Also revert when amountIn == 0, either reserve is 0, or feeBps >= BPS.
    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut,
        uint256 feeBps
    ) internal pure returns (uint256 amountOut) {
        // TODO: implement (≈5–7 minutes)
        amountIn;
        reserveIn;
        reserveOut;
        feeBps;
        amountOut;
        revert NotImplemented();
    }
}
