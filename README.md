# zkp-blockchain-project
# Ensuring transaction privacy in blockchain networks using Zero-Knowledge Proofs (ZKP)

This project implements privacy-preserving transaction protocols on blockchain platforms by leveraging Zero-Knowledge Proofs (ZKP). It enables confidential transaction verification without revealing sensitive details (the sender's balance).

## Technologies Used
- Blockchain Platform: Ethereum
- Smart Contracts: Solidity
- ZKP Frameworks: Groth16
- Development Tools: Remix IDE, ZoKrates

## Prerequisites
- Linux on x86_64 architecture
- Docker and Docker Compose
- Node.js version 12 or higher
- Metamask

## Setting & Runing

### 1. Environment setup
**Deploy besu IBFT 2.0 network**
- Follow the instruction on this link: https://besu.hyperledger.org/private-networks/tutorials/quickstart.
**Set up Metamask**
- Install the MetaMask browser extension and configure it to connect to the custom Quorum IBFT network by adding a new custom network. Import test accounts using private keys stored in ... to use test ethereum.
**Set up Remix IDE**
- Open https://remix.ethereum.org/ and activate ZoKrates plugin.
- Add circuit file [balance_check.zok](contracts/circuit/balance_check.zok) to a new workspace.
- Change solidity compiler to 0.8.19 or lower.
2. Deploy smart contract
- Run ZoKrates setup using its plugin in Remix IDE. After running successfully, files in contracts/circuit will be created.
- Create and compile a smart contract called TransferVerifier.sol that inherits from [verifier.sol](contracts/circuit/verifier.sol) to verify balances and update the sender’s and receiver’s balances after a transaction.
- Deploy & run transaction with "Injected Provider - Metamask" environment, imported account and TransferVerifier.sol contract option.
3. Demo 
- After successfully deploying, the verifier will expose a public function that takes the proof paramaters generated from Zokrates plugin, the amount to be transfered and the receiver's address as input and returns the result whether the transaction is successful or not, and if successful, it will update the smart contract’s balance and the recipient’s balance accordingly.
