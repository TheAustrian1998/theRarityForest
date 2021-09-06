async function main() {
    //Compile
    await hre.run("clean");
    await hre.run("compile");

    //Deploy
    const TheRarityForest = await ethers.getContractFactory("TheRarityForest");
    const theRarityForest = await TheRarityForest.deploy("0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb");
    await theRarityForest.deployed();
    console.log("Deployed to:", theRarityForest.address);

    //Verify
    await hre.run("verify:verify", {
        address: theRarityForest.address,
        constructorArguments: ["0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb"],
    });
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });