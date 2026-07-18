# RegChain Core: RWA Compliance Engine

![License](https://img.shields.io/badge/license-MIT-blue)
![Foundry](https://img.shields.io/badge/Foundry-v1.0-orange)
![Solidity](https://img.shields.io/badge/Solidity-0.8.20-brightgreen)

## Overview
RegChain Core is a smart contract framework for Real World Asset (RWA) compliance and on-chain audit reporting. It demonstrates how role-based authorization, blockchain-based audit records, and decentralized document references can support transparent compliance workflows for tokenized assets.

## Motivation
As tokenized Real World Assets (RWAs) become increasingly adopted, transparent compliance and auditability are essential for institutional blockchain applications.
RegChain demonstrates how role-based authorization and on-chain audit records can support compliance processes while keeping detailed documentation off-chain via IPFS.

## Protocol Flow
1. A Compliance Officer records a compliance report.
2. The report stores jurisdiction, risk score, approval status, and an IPFS document reference.
3. Authorized auditors retrieve and review the compliance record.
4. External applications verify the audit information directly from the blockchain.

## Deployment
The contract is deployed and verified on the Ethereum Sepolia Testnet.

* **Contract Address:** [0x8c66419d3b68dd2ade365627e0e6a15229bca628](https://sepolia.etherscan.io/address/0x8c66419d3b68dd2ade365627e0e6a15229bca628)

## Key Features
- **Role-Based Access Control (RBAC):** Built on OpenZeppelin AccessControl to manage Compliance Officer and Auditor permissions.
- **On-Chain Audit Records:** Stores compliance reports including jurisdiction, risk score, approval status, and IPFS document references.
- **Transparent Compliance Logging:** All compliance events are recorded on-chain and can be independently verified.

## Technical Architecture

**Framework:** Foundry (Forge)

**Language:** Solidity 0.8.20

**Security:** OpenZeppelin AccessControl

**Storage:** On-chain compliance records with IPFS document references

**Network:** Ethereum Sepolia Testnet

## Test Coverage

The project includes automated Foundry tests covering:

- Role-based access control
- Compliance report creation
- Risk score evaluation
- Audit record retrieval

## Developer Guide

### 1. Installation & Setup
Clone the repository and install all necessary dependencies with these commands:

### Clone the project
git clone https://github.com/BlockchainInes/regchain-compliance-engine.git

cd regchain-compliance-engine

### Install OpenZeppelin Contracts
forge install OpenZeppelin/openzeppelin-contracts

### Build the project
forge build

### 2. Quality Assurance (Testing)
I maintain high standards for logic integrity. Run the test suite to verify the contract behavior:

### Run all tests
forge test

### Run tests with gas report for optimization analysis
forge test --gas-report

### 3. Deployment & Verification
To deploy the contract to the Sepolia network, ensure your .env file is set up correctly (refer to .env.example).

### Deploy and verify on Etherscan using environment variables
forge create contracts/RegChainCore.sol:RegChainCore --rpc-url $env:RPC_URL --private-key $env:PRIVATE_KEY --etherscan-api-key $env:ETHERSCAN_API_KEY --verify --broadcast

## Author
* **Project Lead:** Ines Krueger

## License
This project is licensed under the MIT License.
