pragma solidity ^0.4.16;

contract Owned {
    
    // Field:
    address public owner;
    
    // Event:
    event ownerChanged (address newOwner); 
    
    // Modifier:
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }    

    // Constructor:
    function Owned (address _owner) public {
        owner = _owner;
    }
    
    // Change the owner of this instance:
    function changeOwner (address newOwner) public onlyOwner {
        owner = newOwner;
        ownerChanged(newOwner);
    }
}