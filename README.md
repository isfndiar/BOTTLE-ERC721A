# AIRUNNER - NFT Project on ERC721A and ERC721R

**BOTTLE** is an NFT smart contract built using Solidity. This project implements functionalities for NFT minting. The project is developed and tested using the Hardhat framework.

see in [testnet opensea](https://testnets.opensea.io/collection/bottle-20)

# Preview

## NFTs on OpenSea

I don't have the preview of nft erc721A because in [testnet.opensea](https://testnets.opensea.io/assets/sepolia/0xb3942d5ea1abe69964003d60a85b0eb6a83adebf/0) metadata not appear. i'm confusing rn.
but i have the image and ipfs
<img src="image/0.png" >

<img src="image/1.png" >

<img src="image/2.png" >

<img src="image/3.png" >

### interested?

## Features

- **Mint**: all users can mint NFTs. max mint 1 per wallet

- **NFT Ownership**: Ensures proper ownership and transfer functionality for minted NFTs.
- **Refund in 3 minutes**: Ensures user can refund before 3 minutes while buy this nft.

## Prerequisites

Make sure you have the following tools installed:

- [Node.js](https://nodejs.org/)
- [Hardhat](https://hardhat.org/)
- [Solidity](https://docs.soliditylang.org/)
- [MetaMask](https://metamask.io/) (for interacting with the contract)

## Getting Started

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/isfndiar/BOTTLE-ERC721A.git
   cd BOTTLE-ERC721A
   ```

2. Install the dependencies:

   ```bash
   npm install
   ```

3. Install Hardhat if you haven't already:

   ```bash
   npm install --save-dev hardhat
   ```

4. Install additional Hardhat plugins:

   ```bash
   npm install @nomiclabs/hardhat-ethers @openzeppelin/contracts
   ```

### Compiling the Contract

Compile your smart contract using Hardhat:

```bash
npx hardhat compile
```

### Interacting with the Contract

Once the contract is deployed, you can interact with it using Hardhat tasks, scripts, or through the command line.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify it according to your project specifics!
