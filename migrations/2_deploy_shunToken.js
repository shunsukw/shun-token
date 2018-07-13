const ShunToken = artifacts.require('./ShunToken')

module.exports = (deployer) => {
    const initialSupply = 50000e18
    const maxSupply = 100000000e18

    deployer.deploy(ShunToken, initialSupply, maxSupply)
}