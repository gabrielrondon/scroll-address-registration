const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();

module.exports = {
    networks: {
        scrollTestnet: {
            provider: () => new HDWalletProvider(process.env.PRIVATE_KEY, process.env.SCROLL_TESTNET_RPC_URL),
            network_id: 534354,  // Scroll Testnet chain ID
            gas: 4500000,
            gasPrice: 10000000000
        }
    },
    compilers: {
        solc: {
            version: "0.8.0"
        }
    }
};
