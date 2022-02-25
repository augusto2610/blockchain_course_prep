const { ethers } = require("hardhat");

async function main() {
    // Getting the contract to deploy
    const contract = await ethers.getContractFactory('Rental');
    console.log('Deploying Rental contract...');

    const rental = await contract.deploy();
    await rental.deployed();
    console.log('Contract deployed to: ', rental.address);
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});