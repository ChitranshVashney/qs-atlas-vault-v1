// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface Vm {
    function deal(address account, uint256 balance) external;
    function prank(address sender) external;
}

abstract contract TestBase {
    Vm internal constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));
    receive() external payable {}
}
