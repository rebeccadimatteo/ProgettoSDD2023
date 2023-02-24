pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;


    // Adopting a tree
    function adopt(uint treeId) public returns (uint) {
        require(treeId >= 0 && treeId <= 15);

        adopters[treeId] = msg.sender;

        return treeId;
    }
    // Retrieving the adopters
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }

}