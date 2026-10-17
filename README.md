# Solidity 10-Minute Interview Assessment

Live screen to quickly check Solidity knowledge. **~10 minutes total.**

| Time | What |
|------|------|
| ~7 min | Implement `getAmountOut` in `src/interview/InterviewSwap.sol` |
| ~3 min | Name bugs in `src/interview/InterviewBugs.sol` (verbal) |

```bash
forge install
forge build

# After the candidate codes
forge test --match-path "test/interview/*" -vv
```

- Interviewer guide: [docs/INTERVIEW_10MIN.md](docs/INTERVIEW_10MIN.md)
- Answer key: `solution/InterviewSwap.sol`

## Layout

```
src/interview/InterviewSwap.sol   ← coding task
src/interview/InterviewBugs.sol   ← verbal bug-spot
test/interview/                   ← acceptance tests
solution/InterviewSwap.sol        ← answer key (reviewer only)
docs/INTERVIEW_10MIN.md
```
