const Tether = artifacts.require('Tether');
const RWD = artifacts.require('RWD');
const DecentralBank = artifacts.require('DecentralBank');

module.expors = async function deployer() {
  // Depliy Mock Thether Contract
  await deployer.deploy(Tether);

  // Depliy RWD Contract
  await deployer.deploy(RWD);

  // Depliy DecentralBank Contract
  await deployer.deploy(DecentralBank);
};
