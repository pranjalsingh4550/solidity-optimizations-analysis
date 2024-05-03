pragma solidity ^0.4.15;

contract SimpleStorage {
    uint256 storedData;

    function set(uint256 x, uint256 y) public {
        storedData = (x + y);
    }

    function get() public constant returns (uint256) {
        return storedData + 5;
    }
}
