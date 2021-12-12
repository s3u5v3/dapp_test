const Tether = artifacts.require('Tether');

module.expors = async function deployer() {
  await deployer.deploy(Tether);
};
