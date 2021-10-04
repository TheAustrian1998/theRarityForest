const { task } = require("hardhat/config");

task("killTheThing", "killTheThing...", async (_, { ethers }) => {

    const TreasureRescuerAddr = "0x6f158Ab2cA69904eC0E5F9BcA42FAf3D5B5A7C2c";
    const signerAddr = "0x39Ab6cFE9765C641E6dAa46593382a7efB402260";
    const signer = await ethers.getSigner(signerAddr);

    let TreasureRescuer = await ethers.getContractFactory("TreasureRescuer");

    const RescueContract = await TreasureRescuer.attach(TreasureRescuerAddr).connect(signer);
    const   previousBalance = await signer.getBalance();
    const tx = await RescueContract.killTheThing();
    await tx.wait();
    const   nextBalance = await signer.getBalance();
    console.log({cost: ethers.utils.formatEther(nextBalance.sub(previousBalance))});
});