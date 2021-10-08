//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

contract codex {
    string constant public index = "Items";
    string constant public class = "Weapons";
    
    function get_proficiency_by_id(uint _id) public pure returns (string memory description) {
        if (_id == 1) {
            return "Simple";
        } else if (_id == 2) {
            return "Martial";
        } else if (_id == 3) {
            return "Exotic";
        }
    }
    
    function get_encumbrance_by_id(uint _id) public pure returns (string memory description) {
        if (_id == 1) {
            return "Unarmed";
        } else if (_id == 2) {
            return "Light Melee Weapons";
        } else if (_id == 3) {
            return "One-Handed Melee Weapons";
        } else if (_id == 4) {
            return "Two-Handed Melee Weapons";
        } else if (_id == 5) {
            return "Ranged Weapons";
        }
    }
    
    function get_damage_type_by_id(uint _id) public pure returns (string memory description) {
        if (_id == 1) {
            return "Bludgeoning";
        } else if (_id == 2) {
            return "Piercing";
        } else if (_id == 3) {
            return "Slashing";
        }
    }
    
    struct weapon {
        uint id;
        uint cost;
        uint proficiency;
        uint encumbrance;
        uint damage_type;
        uint weight;
        uint damage;
        uint critical;
        int critical_modifier;
        uint range_increment;
        string name;
        string description;
    }

    function item_by_id(uint _id) public pure returns(weapon memory _weapon) {
        if (_id == 1) {
            return black_gauntlet();
        } else if (_id == 2) {
            return silver_sword();
        } else if (_id == 3) {
            return ancient_prince_andre_s_sword();
        } else if (_id == 4) {
            return mechanical_hand();
        } else if (_id == 5) {
            return king_s_son_sword();
        } else if (_id == 6) {
            return thunder_hammer();
        } else if (_id == 7) {
			return old_farmer_sickle();
		}
    }

    function black_gauntlet() public pure returns (weapon memory _weapon) {
        _weapon.id = 1;
        _weapon.name = "Black gauntlet";
        _weapon.cost = 400e18;
        _weapon.proficiency = 1;
        _weapon.encumbrance = 1;
        _weapon.damage_type = 1;
        _weapon.weight = 2;
        _weapon.damage = 3;
        _weapon.critical = 2;
        _weapon.critical_modifier = 0;
        _weapon.range_increment = 0;
        _weapon.description = "A mysterious gauntlet, with mysterious power. A strike with a gauntlet is otherwise considered an unarmed attack. The cost and weight given are for a single gauntlet. Medium and heavy armors (except breastplate) come with gauntlets.";
    }

    function silver_sword() public pure returns (weapon memory _weapon) {
        _weapon.id = 2;
        _weapon.name = "Silver sword";
        _weapon.cost = 600e18;
        _weapon.proficiency = 2;
        _weapon.encumbrance = 2;
        _weapon.damage_type = 2;
        _weapon.weight = 2;
        _weapon.damage = 6;
        _weapon.critical = 2;
        _weapon.critical_modifier = -1;
        _weapon.range_increment = 0;
        _weapon.description = "Even the bravest enemy is afraid to reflect on this sword.";
    }

    function ancient_prince_andre_s_sword() public pure returns (weapon memory _weapon) {
        _weapon.id = 3;
        _weapon.name = "Ancient Prince Andre's Sword";
        _weapon.cost = 60000e18;
        _weapon.proficiency = 3;
        _weapon.encumbrance = 3;
        _weapon.damage_type = 3;
        _weapon.weight = 6;
        _weapon.damage = 10;
        _weapon.critical = 2;
        _weapon.critical_modifier = -1;
        _weapon.range_increment = 0;
        _weapon.description = "Hope the prince doesn't claim his sword.";
    }

    function mechanical_hand() public pure returns (weapon memory _weapon) {
        _weapon.id = 4;
        _weapon.name = "Mechanical hand";
        _weapon.cost = 750e18;
        _weapon.proficiency = 1;
        _weapon.encumbrance = 2;
        _weapon.damage_type = 1;
        _weapon.weight = 1;
        _weapon.damage = 4;
        _weapon.critical = 2;
        _weapon.critical_modifier = 0;
        _weapon.range_increment = 0;
        _weapon.description = "Solid and rigid, but precise and delicate. A strike with a gauntlet is otherwise considered an unarmed attack. The cost and weight given are for a single gauntlet. Medium and heavy armors (except breastplate) come with gauntlets.";
    }

    function king_s_son_sword() public pure returns (weapon memory _weapon) {
        _weapon.id = 5;
        _weapon.name = "King's son sword";
        _weapon.cost = 800e18;
        _weapon.proficiency = 2;
        _weapon.encumbrance = 2;
        _weapon.damage_type = 3;
        _weapon.weight = 2;
        _weapon.damage = 6;
        _weapon.critical = 2;
        _weapon.critical_modifier = -1;
        _weapon.range_increment = 0;
        _weapon.description = "It will be yours when you grow";
    }

    function thunder_hammer() public pure returns (weapon memory _weapon) {
        _weapon.id = 6;
        _weapon.name = "Thunder hammer";
        _weapon.cost = 1000e18;
        _weapon.proficiency = 2;
        _weapon.encumbrance = 3;
        _weapon.damage_type = 1;
        _weapon.weight = 8;
        _weapon.damage = 8;
        _weapon.critical = 3;
        _weapon.critical_modifier = 0;
        _weapon.range_increment = 0;
        _weapon.description = "Forged in the storm, lightning in your hand.";
    }

    function old_farmer_sickle() public pure returns (weapon memory _weapon) {
        _weapon.id = 7;
        _weapon.name = "Old farmer sickle";
        _weapon.cost = 25e18;
        _weapon.proficiency = 1;
        _weapon.encumbrance = 2;
        _weapon.damage_type = 3;
        _weapon.weight = 2;
        _weapon.damage = 6;
        _weapon.critical = 2;
        _weapon.critical_modifier = 0;
        _weapon.range_increment = 0;
        _weapon.description = "Only the old ones remember this sickle.";
    }
}
