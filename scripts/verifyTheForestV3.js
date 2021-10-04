async function main() {
    //Compile
    await hre.run("clean");
    await hre.run("compile");

    const rarityAddr = "0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb";
    const theRarityForestAddr = "0xb37d3d79ea86B0334d9322c695339D577A3D57be";
    const theRarityForestV2Addr = "0x9e894cd5dCC5Bad1eD3663077871d9D010f654b5";
    const rarityXPProxyAddr = "0x640bdeff13ae5527424acd868F65357270b05eB8";

    await hre.run("verify:verify", {
		address: '0x48e6F88F1Ab05677675dE9d14a705f8A137ea2bC',
		constructorArguments: [rarityAddr, theRarityForestAddr, theRarityForestV2Addr, rarityXPProxyAddr],
	});
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });