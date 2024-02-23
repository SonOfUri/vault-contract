// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    address public donor;
    address public beneficiary;
    uint public unlockTime;
    uint public amount;

    constructor(address _beneficiary, uint _unlockTime) payable {
        donor = msg.sender;
        beneficiary = _beneficiary;
        unlockTime = block.timestamp + (_unlockTime * 60); // Set Unlocktime in minutes
        amount = msg.value;
    }

    function claim() public {
        require(msg.sender == beneficiary, "Only the beneficiary can claim the grant");
        require(block.timestamp >= unlockTime, "Grant is not yet unlocked");

        payable(beneficiary).transfer(amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
