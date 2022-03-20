const { ethers } = require("hardhat");

async function main() {
    
    //await showAccountsList();

    const bobAddress = await showAddressDetails("Bob", 14);
    const johnAddress = await showAddressDetails("John", 7);

    // setup contract
    // The address is where the contract was deployed.
    const contractAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
    // Get the contract object
    const contract = await ethers.getContractFactory('Rental');
    const rentalContract = contract.attach(contractAddress);
    
    //await rentalContract.setRentDuration(15);
    const rentDuration = await rentalContract.getRentDuration();
    console.log("Rent duration: " + rentDuration + " months")


    // Save the tenant - the person who pay the rent
    const tenant = await rentalContract.getTenant();
    if(tenant != 0) {
        console.log("Tenant address: " + tenant);
    } else {
        await rentalContract.setTenant(bobAddress);
    }

    // Save the locator - the house owner
    //await rentalContract.setLocator(johnAddress);
    /*const locator = await rentalContract.getLocator();
    console.log("Locator address: " + locator);
    
    await getRealStateBalance();

    const contractOwner = await rentalContract.getOwner();
    console.log("Contract Owner: " + contractOwner);*/
}

async function showAccountsList() {
    const accountsList = await getAccountsList();
    console.log(accountsList);
}

async function getRealStateBalance() {
    const balance = await ethers.provider.getBalance("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266");
    console.log("Real State balance: " + balance);
}

async function getIndexedBalance(address) {
    const accountsList = await getAccountsList();
    const balance = await ethers.provider.getBalance(accountsList[address]);
    console.log(balance);
}

async function getAccountsList() {
    return await ethers.provider.listAccounts();
}

async function showAddressDetails(name, index) {
    const list = await getAccountsList();
    const bobAddress = await list[index];
    console.log(name + " address: " + bobAddress);
    
    const bobBalance = await ethers.provider.getBalance(bobAddress);
    console.log(name + " balance: " + bobBalance);

    return bobAddress
} 

// This is also boilerplate code.
main().then(() => process.exit(0)).catch( error => {
    console.log(error);
    process.exit(1);
}
);