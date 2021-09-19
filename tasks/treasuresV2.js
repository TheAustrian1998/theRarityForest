const { task } = require("hardhat/config");

task("treasuresV2", "Groups quantity by treasures (V2)", async (_, { ethers }) => {

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

    const forestV2Addr = "0x9e894cd5dcc5bad1ed3663077871d9d010f654b5";

    //Attach to contract on fantom mainnet
    let TheRarityForestV2 = await ethers.getContractFactory("TheRarityForestV2");
    //Query total quantity
    let quant = ethers.utils.formatUnits(await TheRarityForestV2.attach(forestV2Addr)._tokenIdCounter(), "wei");
    console.log("total: ", quant);

    //Filter all items
    let items = {};
    let summonners = {};
    for (let i = 0; i < quant; i++) {
        let treasure = await TheRarityForestV2.attach(forestV2Addr).treasure(i);

        if (items[treasure._itemName]) {
            items[treasure._itemName] += 1;
        } else {
            items[treasure._itemName] = 1;
        }

        if (summonners[treasure._summonerId]) {
            summonners[treasure._summonerId] += 1;
        } else {
            summonners[treasure._summonerId] = 1;
        }

        process.stdout.write(`querying treasures... ${Math.trunc(i * 100 / quant)}% \r`);

    }

    //Print
    console.log("\n");
    let sortedItems = sortDict(items);
    console.log(sortedItems);

    console.log("\n");
    let sortedSummoners = sortDict(summonners);
    console.log(sortedSummoners);
});