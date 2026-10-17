// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {InterviewSwap} from "../../src/interview/InterviewSwap.sol";

/// @dev Run after the candidate finishes coding:
///      forge test --match-path "test/interview/*" -vv
contract Interview10MinTest is Test {
    function test_GetAmountOut_HappyPath() public pure {
        uint256 out =
            InterviewSwap.getAmountOut(1_000 ether, 100_000 ether, 100_000 ether, 30);
        // ≈ 987.158 ether for 0.3% fee, equal reserves
        assertApproxEqRel(out, 987.1580343970613 ether, 0.0001e18);
    }

    function test_GetAmountOut_RevertsOnZeroInput() public {
        vm.expectRevert(InterviewSwap.InsufficientInput.selector);
        this._amountOut(0, 100 ether, 100 ether, 30);
    }

    function test_GetAmountOut_RevertsOnEmptyReserves() public {
        vm.expectRevert(InterviewSwap.InsufficientLiquidity.selector);
        this._amountOut(1 ether, 0, 100 ether, 30);
    }

    function test_GetAmountOut_RevertsOnBadFee() public {
        vm.expectRevert(InterviewSwap.InvalidFee.selector);
        this._amountOut(1 ether, 100 ether, 100 ether, 10_000);
    }

    // external wrapper so expectRevert works with a library call
    function _amountOut(uint256 a, uint256 rIn, uint256 rOut, uint256 fee)
        external
        pure
        returns (uint256)
    {
        return InterviewSwap.getAmountOut(a, rIn, rOut, fee);
    }
}
