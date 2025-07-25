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

<img width="1445" height="699" alt="image" src="https://github.com/user-attachments/assets/c4b213bf-44dc-49bf-86dd-32f242932e70" />

  **Deploy besu IBFT 2.0 network**
  - Follow the instruction on this link: https://besu.hyperledger.org/private-networks/tutorials/quickstart. After successfully deploying, we will get a folder that looks like quorum-test-network. 
  **Set up Metamask**
  - Install the MetaMask browser extension and configure it to connect to the custom Quorum IBFT network by adding a new custom network with network details:
     + Network Name: Localhost 8545
     + New RPC URL: http://localhost:8545
     + Chain ID: 1337
     + Currency Symbol: ETH
  - Import test accounts using private keys stored in [genesis.json](quorum-test-network/config/besu/genesis.json) to use test ethereum.
  **Set up Remix IDE**
  - Open https://remix.ethereum.org/ and activate ZoKrates plugin.
  - Add circuit file [balance_check.zok](contracts/circuit/balance_check.zok) to a new workspace.
  - Change solidity compiler to 0.8.19 or lower.
### 2. Deploy smart contract

<img width="1056" height="696" alt="image" src="https://github.com/user-attachments/assets/97b4c1c5-87e2-444e-920e-4ba4eed4bb11" />

  - Run ZoKrates setup using its plugin in Remix IDE. After running successfully, files in contracts/circuit will be created.
  - Create and compile a smart contract called TransferVerifier.sol that inherits from [verifier.sol](contracts/circuit/verifier.sol) to verify balances and update the sender’s and receiver’s balances after a transaction.
  - Deploy & run transaction with "Injected Provider - Metamask" environment, imported account and TransferVerifier.sol contract option.
### 3. Demo 
  - After successfully deploying, the verifier will expose a public function that takes the proof paramaters generated from Zokrates plugin, the amount to be transfered and the receiver's address as input and returns the result whether the transaction is successful or not, and if successful, it will update the smart contract’s balance and the recipient’s balance accordingly.

