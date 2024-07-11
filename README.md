# ETH-AVAX_Module_3_Mint-Burn
## Description
This project is a simple smart contract for minting, burning, and transferring tokens on the Ethereum network. The contract includes functionalities that allow only the owner to mint new tokens, while any user can transfer or burn their tokens.

### Features
* Minting: Only the contract owner can mint new tokens.
* Burning: Any user can burn their own tokens.
* Transferring: Any user can transfer their tokens to another address.

## Getting Started

### Prerequisites
  
* Solidity compiler (Solc).
* Ethereum development environment (e.g., Remix, Hardhat, Truffle).
* MetaMask or other Ethereum wallet for deploying and interacting with the contract or preassigned test wallets can also be used on Remix.

### Installation
* Clone the repository:
* Contract Deployment
* Open the project in your preferred development environment (e.g., Remix, VSCode with Hardhat).
* Compile the contract using the Solidity compiler.

### Deploy the contract to your desired network:

- For Remix: Select the appropriate environment (e.g., JavaScript VM, Injected Web3) and deploy.
- For Hardhat: Use the following script to deploy:

```
async function main() {
  const Token = await ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
```

## Interaction
* After deploying the contract, you can interact with it using the following functions:

### Functions of the contract
* `constructor()`:
The constructor sets the owner of the contract to the address that deploys the contract. It also initializes the total supply of tokens to 0 and assigns this total supply to the deployer's balance.

* `mint(address account, uint256 amount) public`:
Mints new tokens.The address to which the minted tokens will be assigned. Only the owner can mint tokens to their own account.`amount`: The number of tokens to mint.


* `burn(uint256 amount) public`:
Burns tokens from the caller's balance.`amount`: The number of tokens to burn. The caller must have at least the specified amount of tokens in their balance.

* `transfer(address recipient, uint256 amount) public`: Transfers tokens from the caller's balance to another address. `recipient`: The address to which the tokens will be transferred. `amount`: The number of tokens to transfer. The caller must have at least the specified amount of tokens in their balance.

### Example
Here's an example of how to use the contract in a Hardhat environment, for remix the contract can be deployed from the `Deploy and Run Transactions` section:

* Deploy the contract:
```
const { ethers } = require("hardhat");

async function main() {
  const Token = await ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
```
* Minting Tokens

`await token.mint(owner_address, 1000);`
* Transfer tokens:

`await token.transfer(recipient_address, 500);`
* Burn tokens:

`await token.burn(200);`

## Author
Priyanshu Vasava
