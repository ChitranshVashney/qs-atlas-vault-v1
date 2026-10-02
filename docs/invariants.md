# Intended invariants — AtlasVaultV1

These are protocol requirements, not assertions that every version enforces them.

| ID | Requirement |
|---|---|
| ATLAS-SOLVENCY | `address(this).balance >= totalDeposits` after every successful operation. |
| ATLAS-ACCOUNTING | `totalDeposits` equals the sum of all `deposits` balances. |
| ATLAS-AUTH | Only the owner can sweep surplus. |
| ATLAS-RESERVES | Sweeping cannot reduce ETH below outstanding liabilities. |
| ATLAS-PAYOUT | A payout consumes only the caller's recorded entitlement, exactly once. |

## Audit focus

Check the access control and maximum amount in `sweepSurplus`, accounting before external calls, and failed-transfer rollback. Compare historical evidence with this repository's actual guards. Do not suppress a local hypothesis solely because another project was audited.
