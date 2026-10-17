# 10-Minute Solidity Interview Screen

Quick knowledge check for mid/senior candidates. Not a take-home.

## Timing

| Minutes | Activity |
|---------|----------|
| 0–1 | Share screen / open `src/interview/InterviewSwap.sol` |
| 1–7 | Candidate implements `getAmountOut` (formula is in the file) |
| 7–10 | Verbal: open `src/interview/InterviewBugs.sol`, name **2+** bugs |

**Pass bar:** correct formula + at least one valid revert check, and ≥2 real bugs named.

## Part A — Code (live)

**File:** `src/interview/InterviewSwap.sol`

Formula (already in comments):

```text
amountInWithFee = amountIn * (10000 - feeBps)
amountOut = (amountInWithFee * reserveOut) / (reserveIn * 10000 + amountInWithFee)
```

Candidate should also handle bad inputs (`amountIn == 0`, empty reserves, `feeBps >= 10000`).

Verify:

```bash
forge test --match-path "test/interview/*" -vv
```

Answer key: `solution/InterviewSwap.sol`

### What “good” looks like

- Writes the formula correctly (integer division order OK)
- Adds basic validation (even if not all three cases)
- Can explain why fee is applied on input, not output

### Soft fail / probe questions (if time)

- “What happens if `feeBps == 10000`?”
- “Why multiply before divide?”

## Part B — Verbal bugs (~3 min)

**File:** `src/interview/InterviewBugs.sol`

Expected findings (any 2+):

1. **Reentrancy / CEI** — `withdraw` transfers before updating `balances`
2. **Missing access control** — anyone can `setOwner`
3. **Unchecked ERC20 return** — `transfer` / `transferFrom` not checked (SafeERC20)

Optional bonus: donation / accounting if transfer fails silently.

Do **not** require a written report.

## Scoring (pass / fail)

| Signal | Pass | Fail |
|--------|------|------|
| Swap math | Correct or trivially fixable typo | Wrong invariant / invents unrelated formula |
| Safety checks | ≥1 sensible revert | No validation, ignores zeros |
| Bugs | Names ≥2 real issues | Only style nits / “looks fine” |

## Interviewer tips

- Formula is provided on purpose — you are testing Solidity fluency, not memory of Uniswap.
- If stuck at minute 4, hint: “start with the two-line formula, add reverts after.”

## Optional deeper follow-ups (only if time left)

1. What is `nonReentrant` protecting against?
2. Why prefer Checks-Effects-Interactions in `withdraw`?
