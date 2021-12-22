require('babel-register');
require('babel-polyfill');

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: '7545',
      network_id: '*', // Connect to any network
    },
  },
  contracts_directory: './src/contracts/',
  contracts_build_directory: './src/truffle_abis/',
  compiliers: {
    solc: {
      version: '^0.5.16',
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
