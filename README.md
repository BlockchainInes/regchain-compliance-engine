# RegChain Core: RWA Compliance Engine

![License](https://img.shields.io/badge/license-MIT-blue)
![Foundry](https://img.shields.io/badge/Foundry-v1.0-orange)
![Solidity](https://img.shields.io/badge/Solidity-0.8.20-brightgreen)

## Overview
RegChain Core demonstrates a blockchain-native compliance architecture for Real World Assets (RWAs). The project combines role-based authorization, immutable audit records, and decentralized document references to support transparent and verifiable compliance processes.

### Live on Ethereum (Sepolia)
The contract is deployed and verified on the Sepolia Testnet.
* **Contract Address:** [0x8c66419d3b68dd2ade365627e0e6a15229bca628](https://sepolia.etherscan.io/address/0x8c66419d3b68dd2ade365627e0e6a15229bca628)

## Key Features
* **Role-Based Access Control (RBAC):** Leverages OpenZeppelin's AccessControl to manage specific roles for Auditors and Compliance Officers.
* **Immutable Audit Trail:** Logged reports include risk scores, jurisdiction data (EU, US, ASIA), and IPFS metadata hashes.
* **Enterprise Security:** Built with Solidity 0.8.20 and industry-standard security libraries.

## Technical Architecture
* **Framework:** Foundry (Forge)
* **Standards:** OpenZeppelin AccessControl
* **Network:** Sepolia Testnet

## Developer Guide

### 1. Installation & Setup
Clone the repository and install all necessary dependencies with these commands:

### Clone the project
git clone <your-repo-url>
cd RegChain

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
