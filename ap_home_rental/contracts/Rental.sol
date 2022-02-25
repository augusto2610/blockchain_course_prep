// SPDX-License-Identifier: MIT
//Import solidity version
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";


contract Rental is Ownable {
    // The person who pay the rent
    address private tenant;
    // The person who owns the place and receive an amount for rent it
    address private locator;

    uint16 private rentDuration;

    event OnSetRentDuration(string message, uint16 duration);
    event OnTenantSaved(string message, address tenant);
    event onLocatorSaved(string message, address locator);

    function setRentDuration(uint16 duration) public onlyOwner {
        rentDuration = duration;
        emit OnSetRentDuration("Duration is: ", duration);
    }

    function getRentDuration() public view returns(uint16) {
        return rentDuration;
    }

    function setTenant(address tenantAddress) public onlyOwner {
        tenant = tenantAddress;
        emit OnTenantSaved("Tenant saved:" , tenant);
    }

    function getTenant() public view returns(address) {
        return tenant;
    }

    function setLocator(address locatorAddress) public onlyOwner {
        locator = locatorAddress;
        emit onLocatorSaved("Locator saved: ", locator);
    }

    function getLocator() public onlyOwner view returns (address) {
        return locator;
    }
}