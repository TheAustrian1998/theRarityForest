// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.0;

interface ITheRarityForest {
    function transferFrom(address from, address to, uint256 tokenId) external;
    function treasure(uint tokenId) external view returns (string memory _itemName, uint _magic, uint _level);
}
