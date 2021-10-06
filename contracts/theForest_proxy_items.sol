// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IForest {
    function treasure(uint tokenId) external view returns (uint256 _summonerId, string memory _itemName, uint _magic, uint _level);
}

contract theForest_proxy_items {
    IForest constant _forest = IForest(0x48e6F88F1Ab05677675dE9d14a705f8A137ea2bC);

    struct item {
        uint8 base_type; // 1 for goods, 2 for armor, 3 for weapon, 4 for jewelries
        uint8 item_type; // ID of the item type (not the tokenID)
    }

    function get_type(uint _type_id) public pure returns (string memory _type) {
        if (_type_id == 1) {
            _type = "Goods";
        } else if (_type_id == 2) {
            _type = "Armor";
        } else if (_type_id == 3) {
            _type = "Weapons";
        } else if (_type_id == 4) {
            _type = "Jewelries";
        }
    }

    function isValid(uint _base_type, uint _item_type) public pure returns (bool) {
        if (_base_type == 1) {
            return (1 <= _item_type && _item_type <= 34);
        } else if (_base_type == 2) {
            return (1 <= _item_type && _item_type <= 3);
        } else if (_base_type == 3) {
            return (1 <= _item_type && _item_type <= 7);
        } else if (_base_type == 4) {
            return (1 <= _item_type && _item_type <= 11);
        }
        return false;
    }

    function    items(uint _itemID) public view returns (item memory) {
        (,string memory _itemName,,) = _forest.treasure(_itemID);

		if (compareStrings(_itemName, "Dead King crown")) return (item(1, 1));
		if (compareStrings(_itemName, "Ancient book")) return (item(1, 2));
		if (compareStrings(_itemName, "Enchanted book")) return (item(1, 3));
		if (compareStrings(_itemName, "Treasure map")) return (item(1, 4));
		if (compareStrings(_itemName, "Spell book")) return (item(1, 5));
		if (compareStrings(_itemName, "Old damaged coin")) return (item(1, 6));
		if (compareStrings(_itemName, "Dragon egg")) return (item(1, 7));
		if (compareStrings(_itemName, "War helmet")) return (item(1, 8));
		if (compareStrings(_itemName, "Fire boots")) return (item(1, 9));
		if (compareStrings(_itemName, "Enchanted useless tool")) return (item(1, 10));
		if (compareStrings(_itemName, "War trophy")) return (item(1, 11));
		if (compareStrings(_itemName, "Elf skull")) return (item(1, 12));
		if (compareStrings(_itemName, "War book")) return (item(1, 13));
		if (compareStrings(_itemName, "Gold pot")) return (item(1, 14));
		if (compareStrings(_itemName, "Demon head")) return (item(1, 15));
		if (compareStrings(_itemName, "Unknown key")) return (item(1, 16));
		if (compareStrings(_itemName, "Cursed book")) return (item(1, 17));
		if (compareStrings(_itemName, "Giant plant seed")) return (item(1, 18));
		if (compareStrings(_itemName, "Bear claw")) return (item(1, 19));
		if (compareStrings(_itemName, "Glove with diamonds")) return (item(1, 20));
		if (compareStrings(_itemName, "Warrior watch")) return (item(1, 21));
		if (compareStrings(_itemName, "Paladin eye")) return (item(1, 22));
		if (compareStrings(_itemName, "Metal horse saddle")) return (item(1, 23));
		if (compareStrings(_itemName, "Witcher book")) return (item(1, 24));
		if (compareStrings(_itemName, "Witch book")) return (item(1, 25));
		if (compareStrings(_itemName, "Unknown animal ey")) return (item(1, 26));
		if (compareStrings(_itemName, "Shadowy rabbit paw")) return (item(1, 27));
		if (compareStrings(_itemName, "Red Tanned Gloves")) return (item(1, 28));
		if (compareStrings(_itemName, "Paladin heart")) return (item(1, 29));
		if (compareStrings(_itemName, "Cat Claw glove")) return (item(1, 30));
		if (compareStrings(_itemName, "Skull fragment")) return (item(1, 31));
		if (compareStrings(_itemName, "Hawk eye")) return (item(1, 32));
		if (compareStrings(_itemName, "Meteorite fragment")) return (item(1, 33));
		if (compareStrings(_itemName, "Mutant fisheye")) return (item(1, 34));

		if (compareStrings(_itemName, "Haunted cloak")) return (item(1, 1));
		if (compareStrings(_itemName, "Dead hero cape")) return (item(1, 2));
		if (compareStrings(_itemName, "Slain warrior armor")) return (item(1, 3));

        if (compareStrings(_itemName, "Black gauntlet")) return (item(3, 1));
        if (compareStrings(_itemName, "Silver sword")) return (item(3, 2));
        if (compareStrings(_itemName, "Ancient Prince Andre's Sword")) return (item(3, 3));
        if (compareStrings(_itemName, "Mechanical hand")) return (item(3, 4));
        if (compareStrings(_itemName, "King's son sword")) return (item(3, 5));
        if (compareStrings(_itemName, "Thunder hammer")) return (item(3, 6));
        if (compareStrings(_itemName, "Old farmer sickle")) return (item(3, 7));

		if (compareStrings(_itemName, "Haunted ring")) return (item(4,1));
		if (compareStrings(_itemName, "Gold ring")) return (item(4,2));
		if (compareStrings(_itemName, "Magic necklace")) return (item(4,3));
		if (compareStrings(_itemName, "Unknown ring")) return (item(4,4));
		if (compareStrings(_itemName, "Silver ring")) return (item(4,5));
		if (compareStrings(_itemName, "Cursed talisman")) return (item(4,6));
		if (compareStrings(_itemName, "Rare ring")) return (item(4,7));
		if (compareStrings(_itemName, "Enchanted talisman")) return (item(4,8));
		if (compareStrings(_itemName, "Time crystal")) return (item(4,9));
		if (compareStrings(_itemName, "Antique ring")) return (item(4,10));
		if (compareStrings(_itemName, "Wolf necklace")) return (item(4,11));
        return item(0, 0);
    }
	
    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
}
