# qs-atlas-vault-v1

Intentionally vulnerable baseline. A synthetic, test-only Solidity repository for QuillShield project groups and shared audit memory. Do not deploy with real funds.

## Build and test

Requires Foundry and Solidity 0.8.24. No third-party Solidity libraries, tokens, RPC URLs, or private keys are needed.

```bash
forge build
forge test -vv
```

## QuillShield setup

Import this repository with branch `main`. Scope only `src/AtlasVaultV1.sol` for the audit. In the Docs step upload `docs/protocol.md` and `docs/invariants.md`.

Use the group **Atlas protocol** with `qs-atlas-vault-v1`, `qs-atlas-vault-v2`, and `qs-atlas-rewards`. Run a full audit of v1 first to create native memory, then inspect/import that evidence in the other projects. Audit output is model-dependent; fixture docs are not preloaded dashboard memory.

Tests are verification helpers, not production audit scope. For v1, the flaw reproduction test passes when the intentional bug is present. A green test suite does not imply the contracts are secure.
