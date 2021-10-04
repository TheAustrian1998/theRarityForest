const { task } = require("hardhat/config");

task("rescueTreasures", "rescueTreasures...", async (_, { ethers }) => {

    const TreasureRescuerAddr = "0x6f158Ab2cA69904eC0E5F9BcA42FAf3D5B5A7C2c";
    const TheRarityForestV2Addr = "0x9e894cd5dCC5Bad1eD3663077871d9D010f654b5";
    const signerAddr = "0x39Ab6cFE9765C641E6dAa46593382a7efB402260";
    const signer = await ethers.getSigner(signerAddr);

    let TheRarityForestV2 = await ethers.getContractFactory("TheRarityForestV2");
    let TreasureRescuer = await ethers.getContractFactory("TreasureRescuer");

    let totalTreasures = ethers.utils.formatUnits(await TheRarityForestV2.attach(TheRarityForestV2Addr).connect(signer)._tokenIdCounter(), "wei");

    const RescueContract = await TreasureRescuer.attach(TreasureRescuerAddr).connect(signer);
    const   previousBalance = await signer.getBalance();
    for (let index = 0; index < totalTreasures; index += 10) {
        console.log(`INDEX: ${index}`)
        const   from = index;
        const   to = index + 10 > totalTreasures ? totalTreasures : index + 10;
        const tx = await RescueContract.doTheThing(from, to, {gasPrice: ethers.utils.parseUnits("221", "gwei")});
        await tx.wait();
    }
    const   nextBalance = await signer.getBalance();
    console.log({cost: ethers.utils.formatEther(nextBalance.sub(previousBalance))});
});