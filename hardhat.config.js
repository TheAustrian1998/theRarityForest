require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("hardhat-gas-reporter");
require("./tasks/treasuresV1.js");
require("./tasks/treasuresV2.js");
require("./tasks/rescueTreasures.js");
require("./tasks/killTheThing.js");

let { privateKey, alchemyUrl, ftmscanApiKey } = require("./secrets.json");

module.exports = {
  solidity: {
    version: "0.8.0",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
      outputSelection: {
        "*": {
          "*": ["storageLayout"]
        }
      }
    }
  },
  networks: {
    hardhat: {
      forking: {
        url: alchemyUrl,
        loggingEnabled: true
      }
    },
    localhost: {
      url: "http://localhost:8545",
      timeout: 2000000000,
      accounts: [privateKey]
    },
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
