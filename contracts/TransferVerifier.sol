// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./verifier.sol"; 

contract TransferVerifier is Verifier {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
	    balance += msg.value;
    }

    function transferIfValid(
        Proof memory proof,
        uint[1] memory input,
        uint amount,
        address payable recipient
    ) public {
        require(verifyTx(proof, input), "Invalid ZKP proof");
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");
        recipient.transfer(amount);
        balance -= amount;
    }
}
