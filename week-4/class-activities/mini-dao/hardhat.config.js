require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const PRIVATE_KEY = process.env.PRIVATE_KEY;

if (!PRIVATE_KEY) {
  throw new Error("Please set your PRIVATE_KEY in a .env file");
}

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    celo_testnet: {
      url: "https://alfajores-forno.celo-testnet.org",
      accounts: [PRIVATE_KEY], // Load from .env file
      chainId: 44787,
    },
  },
};
