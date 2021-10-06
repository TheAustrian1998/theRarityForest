//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

contract codex {
    string constant public index = "Items";
    string constant public class = "Goods";

    function item_by_id(uint _id) public pure returns(
        uint id,
        uint cost,
        uint weight,
        string memory name,
        string memory description
    ) {
        if (_id == 1) {
			return dead_king_crown();
		} else if (_id == 2) {
			return ancient_book();
		} else if (_id == 3) {
			return enchanted_book();
		} else if (_id == 4) {
			return treasure_map();
		} else if (_id == 5) {
			return spell_book();
		} else if (_id == 6) {
			return old_damaged_coin();
		} else if (_id == 7) {
			return dragon_egg();
		} else if (_id == 8) {
			return war_helmet();
		} else if (_id == 9) {
			return fire_boots();
		} else if (_id == 10) {
			return enchanted_useless_tool();
		} else if (_id == 11) {
			return war_trophy();
		} else if (_id == 12) {
			return elf_skull();
		} else if (_id == 13) {
			return war_book();
		} else if (_id == 14) {
			return gold_pot();
		} else if (_id == 15) {
			return demon_head();
		} else if (_id == 16) {
			return unknown_key();
		} else if (_id == 17) {
			return cursed_book();
		} else if (_id == 18) {
			return giant_plant_seed();
		} else if (_id == 19) {
			return bear_claw();
		} else if (_id == 20) {
			return glove_with_diamonds();
		} else if (_id == 21) {
			return warrior_watch();
		} else if (_id == 22) {
			return paladin_eye();
		} else if (_id == 23) {
			return metal_horse_saddle();
		} else if (_id == 24) {
			return witcher_book();
		} else if (_id == 25) {
			return witch_book();
		} else if (_id == 26) {
			return unknown_animal_eye();
		} else if (_id == 27) {
			return shadowy_rabbit_paw();
		} else if (_id == 28) {
			return red_tanned_gloves();
		} else if (_id == 29) {
			return paladin_heart();
		} else if (_id == 30) {
			return cat_claw_glove();
		} else if (_id == 31) {
			return skull_fragment();
		} else if (_id == 32) {
			return hawk_eye();
		} else if (_id == 33) {
			return meteorite_fragment();
		} else if (_id == 34) {
			return mutant_fisheye();
		}
    }

    function dead_king_crown() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 1;
		name = "Dead King crown";
		cost = 1e18;
		weight = 1;
		description = "Once was a king, his name was lost but not his crown.";
	}
	
	function ancient_book() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 2;
		name = "Ancient book";
		cost = 1e18;
		weight = 1;
		description = "The forest has a lot of stories, not as many as this book.";
	}
	
	function enchanted_book() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 3;
		name = "Enchanted book";
		cost = 1e18;
		weight = 1;
		description = "I wouldn't take it if I was you ...";
	}
	
	function treasure_map() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 4;
		name = "Treasure map";
		cost = 1e18;
		weight = 1;
		description = "Where does it lead? to the rarest destiny.";
	}
	
	function spell_book() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 5;
		name = "Spell book";
		cost = 1e18;
		weight = 1;
		description = "Beware! can cast a spell on you.";
	}
	
	function old_damaged_coin() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 6;
		name = "Old damaged coin";
		cost = 1e18;
		weight = 1;
		description = "An old coin, nobody uses it... right?";
	}
	
	function dragon_egg() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 7;
		name = "Dragon egg";
		cost = 1e18;
		weight = 1;
		description = "The perfect pet.";
	}
	
	function war_helmet() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 8;
		name = "War helmet";
		cost = 1e18;
		weight = 1;
		description = "Survived the battle, not as its former carrier.";
	}
	
	function fire_boots() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 9;
		name = "Fire boots";
		cost = 1e18;
		weight = 1;
		description = "The God of Fire created these. Only a cold soul could carry them.";
	}
	
	function enchanted_useless_tool() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 10;
		name = "Enchanted useless tool";
		cost = 1e18;
		weight = 1;
		description = "Very promising, but useless.";
	}
	
	function war_trophy() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 11;
		name = "War trophy";
		cost = 1e18;
		weight = 1;
		description = "A war where too much was lost.";
	}
	
	function elf_skull() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 12;
		name = "Elf skull";
		cost = 1e18;
		weight = 1;
		description = "The anatomy of an elf, the trophy of his assassin";
	}
	
	function war_book() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 13;
		name = "War book";
		cost = 1e18;
		weight = 1;
		description = "How to start a war, how to bury your soldier friends...";
	}
	
	function gold_pot() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 14;
		name = "Gold pot";
		cost = 1e18;
		weight = 1;
		description = "The temptation to put coin inside is hard to resist";
	}
	
	function demon_head() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 15;
		name = "Demon head";
		cost = 1e18;
		weight = 1;
		description = "Shadowy figure, now headless.";
	}
	
	function unknown_key() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 16;
		name = "Unknown key";
		cost = 1e18;
		weight = 1;
		description = "Whatever this may open, it's a complete mystery.";
	}
	
	function cursed_book() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 17;
		name = "Cursed book";
		cost = 1e18;
		weight = 1;
		description = "An ancient enchantment. Whoever reads this will be forgotten forever.";
	}
	
	function giant_plant_seed() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 18;
		name = "Giant plant seed";
		cost = 1e18;
		weight = 1;
		description = "Little like a bug, tall like the sky.";
	}

	
	function bear_claw() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 19;
		name = "Bear claw";
		cost = 1e18;
		weight = 1;
		description = "Now, you can claim you survived a Bear.";
	}
	
	function glove_with_diamonds() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 20;
		name = "Glove with diamonds";
		cost = 1e18;
		weight = 1;
		description = "Glamor is just one of its characteristics.";
	}
	
	function warrior_watch() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 21;
		name = "Warrior watch";
		cost = 1e18;
		weight = 1;
		description = "A warrior never has enough time.";
	}
	
	function paladin_eye() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 22;
		name = "Paladin eye";
		cost = 1e18;
		weight = 1;
		description = "Do not lose sight of it, it could be useful for its owner.";
	}
	
	function metal_horse_saddle() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 23;
		name = "Metal horse saddle";
		cost = 1e18;
		weight = 1;
		description = "Now you only need a horse.";
	}
	
	function witcher_book() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 24;
		name = "Witcher book";
		cost = 1e18;
		weight = 1;
		description = "Magic, spells, enchantments. Everything in your hand.";
	}
	
	function witch_book() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 25;
		name = "Witch book";
		cost = 1e18;
		weight = 1;
		description = "Shady secrets, nobody should see it.";
	}
	
	function unknown_animal_eye() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 26;
		name = "Unknown animal ey";
		cost = 1e18;
		weight = 1;
		description = "From a beast, or a pet, a monster or a bunny.";
	}
	
	function shadowy_rabbit_paw() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 27;
		name = "Shadowy rabbit paw";
		cost = 1e18;
		weight = 1;
		description = "A one-legged rabbit is still a rabbit.";
	}
	
	function red_tanned_gloves() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 28;
		name = "Red Tanned Gloves";
		cost = 1e18;
		weight = 1;
		description = "Were these tanned with blood? No one can know.";
	}
	
	function paladin_heart() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 29;
		name = "Paladin heart";
		cost = 1e18;
		weight = 1;
		description = "Filled with Valor, glory, but most important, Alturisum";
	}
	
	function cat_claw_glove() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 30;
		name = "Cat Claw glove";
		cost = 1e18;
		weight = 1;
		description = "Which feline was the owner of such claws? Matters not. You may wear don them now.";
	}
	
	function skull_fragment() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 31;
		name = "Skull fragment";
		cost = 1e18;
		weight = 1;
		description = "A puzzle to solve. What did the former owner of this head think?";
	}
	
	function hawk_eye() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 32;
		name = "Hawk eye";
		cost = 1e18;
		weight = 1;
		description = "It gives you precision. In your decisions and in your shots.";
	}
	
	function meteorite_fragment() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 33;
		name = "Meteorite fragment";
		cost = 1e18;
		weight = 1;
		description = "Unknown alien power.";
	}
	
	function mutant_fisheye() public pure returns (
		uint id,
		uint cost,
		uint weight,
		string memory name,
		string memory description
	) {
		id = 34;
		name = "Mutant fisheye";
		cost = 1e18;
		weight = 1;
		description = "The sea is very strange...";
	}
}
