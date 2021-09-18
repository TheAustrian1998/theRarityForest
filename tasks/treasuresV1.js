const { task } = require("hardhat/config");

task("treasuresV1", "Groups quantity by treasures (V1)", async (_, { ethers }) => {

    //Sort a dict
    function sortDict(dict) {
        // Create items array
        let items = Object.keys(dict).map(function (key) {
            return [key, dict[key]];
        });

        // Sort the array based on the second element
        items.sort(function (first, second) {
            return second[1] - first[1];
        });

        return items;
    }

    const forestV1Addr = "0xb37d3d79ea86B0334d9322c695339D577A3D57be";

    //Attach to contract on fantom mainnet
    let TheRarityForest = await ethers.getContractFactory("TheRarityForest");
    //Query total quantity
    let quant = ethers.utils.formatUnits(await TheRarityForest.attach(forestV1Addr)._tokenIdCounter(), "wei");
    console.log("total: ", quant);

    //Filter all items
    let items = {};
    for (let i = 0; i < quant; i++) {
        let treasure = await TheRarityForest.attach(forestV1Addr).treasure(i);

        if (items[treasure._itemName]) {
            items[treasure._itemName] += 1;
        } else {
            items[treasure._itemName] = 1;
        }

        process.stdout.write(`querying treasures... ${Math.trunc(i * 100 / quant)}% \r`);

    }

    //Print
    console.log("\n");
    let sortedItems = sortDict(items);
    console.log(sortedItems);
});