const { expect } = require("chai");

describe("doTheThing", function () {

    let rarity = "0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb";
    let forestV1 = "0xb37d3d79ea86B0334d9322c695339D577A3D57be"
    let forestV2 = "0x9e894cd5dCC5Bad1eD3663077871d9D010f654b5";

    before(async function () {
        //Deploy
        this.TheRarityForestV2 = await ethers.getContractFactory("TheRarityForestV2");

        this.TheRarityForestV3 = await ethers.getContractFactory("TheRarityForestV3");
        this.theRarityForestV3 = await this.TheRarityForestV3.deploy(rarity, forestV1, forestV2, ethers.constants.AddressZero);
        await this.theRarityForestV3.deployed();

        this.TreasureRescuer = await ethers.getContractFactory("TreasureRescuer");
        this.treasureRescuer = await this.TreasureRescuer.deploy(this.theRarityForestV3.address);
        await this.treasureRescuer.deployed();

        await this.theRarityForestV3.setRescuer(this.treasureRescuer.address);
    });

    it("doTheThing...", async function () {
        // let signerAddr = "0x16eC8a7F9d21ea94Be12d4765aD2E5597f82c9Fe";

        // await hre.network.provider.request({
        //     method: "hardhat_impersonateAccount",
        //     params: [signerAddr],
        // });

        // const signer = await ethers.getSigner(signerAddr)

        let totalTreasures = ethers.utils.formatUnits(await this.TheRarityForestV2.attach(forestV2)._tokenIdCounter(), "wei");
        console.log(totalTreasures);

        await this.treasureRescuer.doTheThing(0, 10);
    });

});