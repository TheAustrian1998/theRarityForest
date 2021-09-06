const { expect } = require("chai");
const { smock } = require("@defi-wonderland/smock");

describe("theRarityForest", function () {

    //I hardcoded some values, please, do not do that at home

    before(async function () {
        this.timeout(60000);
        [deployerSigner] = await ethers.getSigners();

        //Mock rarity
        this.Rarity = await smock.mock('rarity');
        this.rarity = await this.Rarity.deploy();

        //Deploy
        this.TheRarityForest = await ethers.getContractFactory("TheRarityForest");
        this.theRarityForest = await this.TheRarityForest.deploy(this.rarity.address);
        await this.theRarityForest.deployed();

        await this.rarity.summon(5);
        await this.rarity.summon(4);

        await this.rarity.setVariable('level', {
            1: 6
        });

        await this.rarity.setVariable('xp', {
            1: ethers.utils.parseUnits("1500000")
        });
    });

    it("Should start research successfully...", async function () {
        //summoner #0 => level 1, 0 xp
        //summoner #1 => level 6, 15000 xp
        await expect(this.theRarityForest.startResearch(0, 7)).to.be.reverted;
        await this.theRarityForest.startResearch(1, 7);
    });

    it("Should discover a treasure successfully...", async function () {
        await expect(this.theRarityForest.discover(1)).to.be.reverted;
        await expect(this.theRarityForest.discover(0)).to.be.reverted;

        //Time travel (8 days)
        await network.provider.send("evm_increaseTime", [691200])

        await this.theRarityForest.discover(1);
        let treasure = await this.theRarityForest.treasure(0)
        console.log("-name:", treasure[0], "-magic:", ethers.utils.formatUnits(treasure[1], "wei"), "-level:", ethers.utils.formatUnits(treasure[2], "wei"));
    });

    it("Should level up a treasure successfully...", async function () {
        await expect(this.theRarityForest.levelUp(0, 0)).to.be.reverted;

        let treasureBefore = await this.theRarityForest.treasure(0);
        let levelBefore = ethers.utils.formatUnits(treasureBefore[2], "wei");
        await this.rarity.approve(this.theRarityForest.address, 1);
        await this.theRarityForest.levelUp(1, 0);

        let treasureAfter = await this.theRarityForest.treasure(0);
        let levelAfter = ethers.utils.formatUnits(treasureAfter[2], "wei");
        expect(Number(levelAfter)).equal(Number(levelBefore) + 1);
    });

});