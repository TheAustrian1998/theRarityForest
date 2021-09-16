const { expect } = require("chai");
const { smock } = require("@defi-wonderland/smock");

describe("ERC721", function () {
    beforeEach(async function () {
        //Preparing the env
        [this.deployerSigner, this.anotherSigner] = await ethers.getSigners();

        //Mock rarity
        this.Rarity = await smock.mock('rarity');
        this.rarity = await this.Rarity.deploy();

        //Deploy theRarityForest (V1)
        this.TheRarityForest = await ethers.getContractFactory("TheRarityForest");
        this.theRarityForest = await this.TheRarityForest.deploy(this.rarity.address);
        await this.theRarityForest.deployed();

        //Deploy
        this.TheRarityForestV2 = await ethers.getContractFactory("TheRarityForestV2");
        this.theRarityForestV2 = await this.TheRarityForestV2.deploy(this.rarity.address, this.theRarityForest.address);
        await this.theRarityForestV2.deployed();

        //deployerSigner config
        await this.rarity.connect(this.deployerSigner).summon(5);
        await this.rarity.connect(this.deployerSigner).summon(4);

        await this.rarity.setVariable('level', {
            //Level up
            1: 2
        });

        await this.rarity.setVariable('xp', {
            //XP up
            1: ethers.utils.parseUnits("1500000")
        });

        await this.theRarityForestV2.connect(this.deployerSigner).startResearch(1, 4);
        await network.provider.send("evm_increaseTime", [691200]);
        await this.theRarityForestV2.connect(this.deployerSigner).discover(1);

        //anotherSigner config
        await this.rarity.connect(this.anotherSigner).summon(5);
        await this.rarity.connect(this.anotherSigner).summon(4);
        
        await this.rarity.setVariable('level', {
            //Level up
            3: 2
        });

        await this.rarity.setVariable('xp', {
            //XP up
            3: ethers.utils.parseUnits("1500000")
        });

        //Mint a treasure in V2
        await this.theRarityForestV2.connect(this.anotherSigner).startResearch(3, 4);
        await network.provider.send("evm_increaseTime", [691200]);
        await this.theRarityForestV2.connect(this.anotherSigner).discover(3);
    });

    it("approve...", async function(){
        //Not owner, must revert
        await expect(this.theRarityForestV2.connect(this.anotherSigner).approve(3,1,0)).to.be.reverted;
        //Owner, must approve
        await this.theRarityForestV2.connect(this.deployerSigner).approve(1,3,0);
    });

    it("setApprovalForAll...", async function(){
        //Not owner, must revert
        await expect(this.theRarityForestV2.connect(this.anotherSigner).setApprovalForAll(1,3,true)).to.be.reverted;
        //Owner, must approve
        await this.theRarityForestV2.connect(this.deployerSigner).setApprovalForAll(1,3,true);
    });

    it("safeTransferFrom...", async function(){
        //Not owner, must revert
        await expect(this.theRarityForestV2.connect(this.anotherSigner).transferFrom(3,1,0)).to.be.reverted;
        //Owner, must approve
        await this.theRarityForestV2.connect(this.deployerSigner).transferFrom(1,3,0);
    });
});

describe("theRarityForestV2", function () {

    //I hardcoded some values, please, do not do that at home

    before(async function () {
        //Preparing the env
        [deployerSigner] = await ethers.getSigners();

        //Mock rarity
        this.Rarity = await smock.mock('rarity');
        this.rarity = await this.Rarity.deploy();

        //Deploy theRarityForest (V1)
        this.TheRarityForest = await ethers.getContractFactory("TheRarityForest");
        this.theRarityForest = await this.TheRarityForest.deploy(this.rarity.address);
        await this.theRarityForest.deployed();

        //Deploy
        this.TheRarityForestV2 = await ethers.getContractFactory("TheRarityForestV2");
        this.theRarityForestV2 = await this.TheRarityForestV2.deploy(this.rarity.address, this.theRarityForest.address);
        await this.theRarityForestV2.deployed();

        await this.rarity.summon(5);
        await this.rarity.summon(4);

        //Level up
        await this.rarity.setVariable('level', {
            1: 2
        });

        //XP up
        await this.rarity.setVariable('xp', {
            1: ethers.utils.parseUnits("1500000")
        });

        //Mint a treasure in V1
        await this.theRarityForest.startResearch(1, 4);
        await network.provider.send("evm_increaseTime", [691200]);
        await this.theRarityForest.discover(1);
    });

    it("Should start research successfully...", async function () {
        //summoner #0 => level 1, 0 xp
        //summoner #1 => level 2, 1500000 xp
        await expect(this.theRarityForestV2.startResearch(0, 7)).to.be.reverted;
        await this.theRarityForestV2.startResearch(1, 7);
    });

    it("Should discover a treasure successfully...", async function () {
        await expect(this.theRarityForestV2.discover(1)).to.be.reverted;
        await expect(this.theRarityForestV2.discover(0)).to.be.reverted;

        //Time travel (7 days)
        await network.provider.send("evm_increaseTime", [604800])

        await this.theRarityForestV2.discover(1);
        let treasure = await this.theRarityForestV2.treasure(0)
        console.log("-summoner#:", ethers.utils.formatUnits(treasure[0], "wei"), "\n-name:", treasure[1], "\n-magic:", ethers.utils.formatUnits(treasure[2], "wei"), "\n-level:", ethers.utils.formatUnits(treasure[3], "wei"));
    });

    it("Should level up a treasure successfully...", async function () {
        await expect(this.theRarityForestV2.levelUp(0, 0)).to.be.reverted;

        let treasureBefore = await this.theRarityForestV2.treasure(0);
        let levelBefore = ethers.utils.formatUnits(treasureBefore[3], "wei");
        await this.rarity.approve(this.theRarityForestV2.address, 1);
        await this.theRarityForestV2.levelUp(0);

        let treasureAfter = await this.theRarityForestV2.treasure(0);
        let levelAfter = ethers.utils.formatUnits(treasureAfter[3], "wei");
        expect(Number(levelAfter)).equal(Number(levelBefore) + 1);
    });

    it("Should restore a treasure successfully...", async function(){
        await this.theRarityForest.approve(this.theRarityForestV2.address, 0);
        await this.theRarityForestV2.restoreTreasure(0, 1);
        expect("0x000000000000000000000000000000000000dEaD").equal(await this.theRarityForest.ownerOf(0));
    });

    it("Get treasures by summoner...", async function(){
        let arr = await this.theRarityForestV2.getTreasuresBySummoner(1);
        arr = arr.map((n) => {
            console.log("-summoner#", ethers.utils.formatUnits(n.summonerId, "wei"), "\n-itemName:",n.itemName, "\n-magic:",ethers.utils.formatUnits(n.magic, "wei"),"\n-level:",ethers.utils.formatUnits(n.level, "wei"));
            console.log("\n");
        });
    });

    it("Get researches by summoner...", async function(){
        let res = await this.theRarityForestV2.getResearchBySummoner(1);
        console.log("-timeInDays:", ethers.utils.formatUnits(res.timeInDays, "wei"), "\n-initBlockTs:", ethers.utils.formatUnits(res.initBlockTs, "wei"), "\n-endBlockTs:", ethers.utils.formatUnits(res.endBlockTs, "wei"));
    });

});