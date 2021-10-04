async function main() {
    //Compile
    await hre.run("clean");
    await hre.run("compile");

    const rarityAddr = "0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb";
    const theRarityForestAddr = "0xb37d3d79ea86B0334d9322c695339D577A3D57be";
    const theRarityForestV2Addr = "0x9e894cd5dCC5Bad1eD3663077871d9D010f654b5";
    const rarityXPProxyAddr = "0x640bdeff13ae5527424acd868F65357270b05eB8";

    //Deploy
    const TheRarityForestV3 = await ethers.getContractFactory("TheRarityForestV3");
    const theRarityForestV3 = await TheRarityForestV3.deploy(rarityAddr, theRarityForestAddr, theRarityForestV2Addr, rarityXPProxyAddr);
    await theRarityForestV3.deployed();
    console.log("Deployed V3 to:", theRarityForestV3.address);

    //Deploy
    const TreasureRescuer = await ethers.getContractFactory("TreasureRescuer");
    const treasureRescuer = await TreasureRescuer.deploy(theRarityForestV3.address);
    await treasureRescuer.deployed();
    console.log("Deployed TR to:", treasureRescuer.address);

    //Setting rescuer
    await theRarityForestV3.setRescuer(treasureRescuer.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });