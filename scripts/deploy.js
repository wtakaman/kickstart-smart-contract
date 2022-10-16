const hre = require('hardhat');

async function main() {
	const CampaignFactory = await hre.ethers.getContractFactory('CampaignFactory');
	return await CampaignFactory.deploy();
}

main()
	.then((sc) => {
		console.log('CampaignFactory deployed to:', sc.address);
	})
	.catch((error) => {
		console.error(error);
	});
