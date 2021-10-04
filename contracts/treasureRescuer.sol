//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import "./interfaces/ITheRarityForestV3.sol";

contract TreasureRescuer {
    bool public canDoTheThing = true;

    constructor(address _rarityForestContractV3){
        rarityForestContractV3 = ITheRarityForestV3(_rarityForestContractV3);
        owner = msg.sender;
    }

    ITheRarityForestV3 public rarityForestContractV3;
    address public owner;

    function doTheThing(uint fromTokenId, uint toTokenId) public {
        require(msg.sender == owner, "not owner");
        require(canDoTheThing, "can't do the thing");
        for (uint256 i = fromTokenId; i < toTokenId; i++) {
            rarityForestContractV3.saveTreasure(i);
        }
    }

    function    killTheThing() public {
        require(msg.sender == owner, "not owner");
        canDoTheThing = false;
    }
}