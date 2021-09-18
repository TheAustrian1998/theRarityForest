require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("hardhat-gas-reporter");
require("./tasks/treasuresV1.js");
require("./tasks/treasuresV2.js");

let { privateKey, alchemyUrl, ftmscanApiKey } = require("./secrets.json");

module.exports = {
  solidity: {
    version: "0.8.0",
    settings: {
      outputSelection: {
        "*": {
          "*": ["storageLayout"]
        }
      }
    }
  },
  networks: {
    fantom: {
      url: alchemyUrl,
      accounts: [privateKey]
    }
  },
  etherscan: {
    apiKey: ftmscanApiKey
  },
  gasReporter: {
    excludeContracts: ["rarity.sol", "theRarityForest.sol", "ERC721.sol"]
  }
};
