// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @notice QuillShield UI/audit fixture. Not a production contract.
contract AtlasVaultV1 {
    address public immutable owner = msg.sender;
    mapping(address => uint256) public deposits;
    uint256 public totalDeposits;

    function deposit() external payable {
        require(msg.value > 0, "empty deposit");
        deposits[msg.sender] += msg.value;
        totalDeposits += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(amount > 0 && deposits[msg.sender] >= amount, "invalid withdrawal");
        deposits[msg.sender] -= amount;
        totalDeposits -= amount;
        (bool ok,) = payable(msg.sender).call{value: amount}("");
        require(ok, "transfer failed");
    }

    // INTENTIONAL TEST FLAW: missing authorization and reserve protection.
    function sweepSurplus(address payable recipient, uint256 amount) external {
        (bool ok,) = recipient.call{value: amount}("");
        require(ok, "transfer failed");
    }

    receive() external payable {}
}
