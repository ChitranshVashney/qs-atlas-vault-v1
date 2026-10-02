# Atlas protocol — AtlasVaultV1

## Purpose

Intentionally vulnerable baseline. This standalone component uses native ETH only. It has no live deployment or external protocol dependencies.

## Accounting and trust

The deployer is the immutable owner. The `deposits` mapping records individual liabilities; `totalDeposits` records their aggregate. Contract ETH must cover those liabilities. Donations are surplus and create no claim for their sender.

Only the owner may sweep surplus. Even the owner must not withdraw reserved user funds. User payouts must reduce individual and aggregate liabilities before external transfers. A reverted transfer must revert accounting updates as well.

Depositors may withdraw only their own credited ETH.

## Relationship to other projects

The vaults and rewards pool share the same reserve-protection principle. Names and storage differ. Evidence from another repository is historical context and must be checked against this component. V2 corrects the known v1 sweep flaw; a historical v1 finding is not automatically a current v2 finding.

## Known fixture behavior

V1 deliberately violates authorization and reserve protection in sweepSurplus. A stranger can drain deposited ETH while liabilities remain. This is an intentional local audit fixture.
