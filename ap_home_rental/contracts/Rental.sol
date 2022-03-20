// SPDX-License-Identifier: MIT
//Import solidity version
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Rental is Ownable {
    // TODO make some test to finish v0.1

    // The person who pay the rent
    address private tenant;
    // The person who owns the place and receive an amount for rent it
    address private locator;

    uint16 private rentDuration;

    event OnSetRentDuration(uint16 duration);
    event OnTenantSaved(address tenant);
    event onLocatorSaved(address locator);

    function setRentDuration(uint16 duration) public onlyOwner {
        rentDuration = duration;
        emit OnSetRentDuration(duration);
    }

    function getRentDuration() public view returns(uint16) {
        return rentDuration;
    }

    function setTenant(address tenantAddress) public onlyOwner {
        require(tenantAddress.balance > 0, "Tenant balance should be grather than 0");
        require(tenantAddress != locator, "Tenant cannot be the same address than locator");
        tenant = tenantAddress;
        emit OnTenantSaved(tenant);
    }

    function getTenant() public view returns(address) {
        return tenant;
    }

    function setLocator(address locatorAddress) public onlyOwner {
        locator = locatorAddress;
        transferOwnership(locator);
        emit onLocatorSaved(locator);
    }

    function getLocator() public view returns (address) {
        return locator;
    }

    function getOwner() public view returns(address) {
        return this.owner();
    }

    function payRent() public payable {
        (bool sent, bytes memory data) = locator.call{value: msg.value}("");
        require(sent, "Failed to send ethers");
    }
}