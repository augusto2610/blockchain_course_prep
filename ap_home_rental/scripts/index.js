const { ethers } = require("hardhat");

async function main() {
    
    await getAccountsList();

    await getRealStateBalance();
   
    await getIndexedBalance(3);


    // setup contract
    // The address is where the contract was deployed.
    const contractAddress = '0x5fbdb2315678afecb367f032d93f642f64180aa3';
    // Get the contract object
    const contract = await ethers.getContractFactory('Rental');
    const rentalContract = contract.attach(contractAddress);
    
    //await rentalContract.setRentDuration(12);
}

async function getAccountsList() {
    const accountsList = await ethers.provider.listAccounts();
    console.log(accountsList);
}

async function getRealStateBalance() {
    const balance = await ethers.provider.getBalance("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266");
    console.log(balance);
}

async function getIndexedBalance(address) {
    const accountsList = await ethers.provider.listAccounts();

    const balance = await ethers.provider.getBalance(accountsList[address]);
    console.log(balance);
}

// This is also boilerplate code.
main().then(() => process.exit(0)).catch( error => {
    console.log(error);
    process.exit(1);
}
);