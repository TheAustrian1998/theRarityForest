//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

contract codex {
    string constant public index = "Items";
    string constant public class = "Jewelry";
    
	function get_type_by_id(uint _id) public pure returns (string memory description) {
		if (_id == 1) {
			return "Amulet";
		} else if (_id == 2) {
			return "Bracelet";
		} else if (_id == 3) {
			return "Necklace";
		} else if (_id == 4) {
			return "Ring";
		} else if (_id == 5) {
			return "Belt";
		}
	}
    
    struct jewel {
        uint id;
        uint cost;
        uint part_type;
        uint weight;
        string name;
        string description;
    }

    function item_by_id(uint _id) public pure returns(jewel memory _jewel) {
		if (_id == 1) {
			return haunted_ring();
		} else if (_id == 2) {
			return gold_ring();
		} else if (_id == 3) {
			return magic_necklace();
		} else if (_id == 4) {
			return unknown_ring();
		} else if (_id == 5) {
			return silver_ring();
		} else if (_id == 6) {
			return cursed_talisman();
		} else if (_id == 7) {
			return rare_ring();
		} else if (_id == 8) {
			return enchanted_talisman();
		} else if (_id == 9) {
			return time_crystal();
		} else if (_id == 10) {
			return antique_ring();
		} else if (_id == 11) {
			return wolf_necklace();
		}
	}

	function haunted_ring() public pure returns (jewel memory _jewel) {
		_jewel.name = "Haunted ring";
		_jewel.id = 1;
		_jewel.cost = 6e18;
		_jewel.part_type = 4;
		_jewel.weight = 1;
		_jewel.description = "Tells the story, that belonged to a witch...";
	}

	function gold_ring() public pure returns (jewel memory _jewel) {
		_jewel.name = "Gold ring";
		_jewel.id = 2;
		_jewel.cost = 6e18;
		_jewel.part_type = 4;
		_jewel.weight = 1;
		_jewel.description = "Crafted by nobody, 'belongs to whoever finds it' is engraved on the ring...";
	}

	function magic_necklace() public pure returns (jewel memory _jewel) {
		_jewel.name = "Magic necklace";
		_jewel.id = 3;
		_jewel.cost = 6e18;
		_jewel.part_type = 3;
		_jewel.weight = 1;
		_jewel.description = "An unprecedented magic, anyway it looks cool.";
	}

	function unknown_ring() public pure returns (jewel memory _jewel) {
		_jewel.name = "Unknown ring";
		_jewel.id = 4;
		_jewel.cost = 6e18;
		_jewel.part_type = 4;
		_jewel.weight = 1;
		_jewel.description = "A mystery created in the hardest metal.";
	}

	function silver_ring() public pure returns (jewel memory _jewel) {
		_jewel.name = "Silver ring";
		_jewel.id = 5;
		_jewel.cost = 6e18;
		_jewel.part_type = 4;
		_jewel.weight = 1;
		_jewel.description = "Bright at first, dark in oblivion.";
	}

	function cursed_talisman() public pure returns (jewel memory _jewel) {
		_jewel.name = "Cursed talisman";
		_jewel.id = 6;
		_jewel.cost = 6e18;
		_jewel.part_type = 1;
		_jewel.weight = 1;
		_jewel.description = "When it was not enchanted it gave lucky, now it only gives death.";
	}

	function rare_ring() public pure returns (jewel memory _jewel) {
		_jewel.name = "Rare ring";
		_jewel.id = 7;
		_jewel.cost = 6e18;
		_jewel.part_type = 4;
		_jewel.weight = 1;
		_jewel.description = "Very rare, hope it has a good price in the market.";
	}

	function enchanted_talisman() public pure returns (jewel memory _jewel) {
		_jewel.name = "Enchanted talisman";
		_jewel.id = 8;
		_jewel.cost = 6e18;
		_jewel.part_type = 1;
		_jewel.weight = 1;
		_jewel.description = "When it was not enchanted it gave luck, now it only gives death.";
	}

	function time_crystal() public pure returns (jewel memory _jewel) {
		_jewel.name = "Time crystal";
		_jewel.id = 9;
		_jewel.cost = 6e18;
		_jewel.part_type = 1;
		_jewel.weight = 1;
		_jewel.description = "If the former owner of this crystal could go back in time, he would surely avoid losing it.";
	}

	function antique_ring() public pure returns (jewel memory _jewel) {
		_jewel.name = "Antique ring";
		_jewel.id = 10;
		_jewel.cost = 6e18;
		_jewel.part_type = 4;
		_jewel.weight = 1;
		_jewel.description = "An ancient power, a present from the gods, the future of its bearer.";
	}

	function wolf_necklace() public pure returns (jewel memory _jewel) {
		_jewel.name = "Wolf necklace";
		_jewel.id = 11;
		_jewel.cost = 6e18;
		_jewel.part_type = 3;
		_jewel.weight = 1;
		_jewel.description = "For a wolf or a human, or both at the same time.";
	}
}
