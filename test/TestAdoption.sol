pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // The id of the tree that will be used for testing
    uint expectedtreeId = 8;

    //The expected owner of adopted tree is this contract
    address expectedAdopter = address(this);

    // Testing the adopt() function
    function testUserCanAdopttree() public {
        uint returnedId = adoption.adopt(expectedtreeId);

        Assert.equal(returnedId, expectedtreeId, "Adoption of the expected tree should match what is returned.");
    }
    // Testing retrieval of a single tree's owner
    function testGetAdopterAddressBytreeId() public {
        address adopter = adoption.adopters(expectedtreeId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected tree should be this contract");
    }
    // Testing retrieval of all tree owners
    function testGetAdopterAddressBytreeIdInArray() public {
        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedtreeId], expectedAdopter, "Owner of the expected tree should be this contract");
    }


}
