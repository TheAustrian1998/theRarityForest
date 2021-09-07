// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

interface IRarity {
    function ownerOf(uint256 tokenId) external view returns (address owner);
    function summoner(uint _summoner) external view returns (uint _xp, uint _log, uint _class, uint _level);
    function spend_xp(uint _summoner, uint _xp) external;
    function getApproved(uint256 tokenId) external view returns (address);
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}