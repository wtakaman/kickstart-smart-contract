const assert = require('assert');
const { ethers, waffle } = require('hardhat');

let factory;
let campaignAddress;
let campaign;
let owner;
let addr1;
let addr2;
let addrs;

beforeEach(async () => {
	[owner, addr1, addr2, ...addrs] = await ethers.getSigners();

	const CampaignFactory = await ethers.getContractFactory('CampaignFactory');
	factory = await CampaignFactory.deploy();
	await factory.deployed();

	campaign = await factory.createCampaign('it is a title', '@twitter', 'image.jpg', '100');
	await campaign.wait();

	[campaignAddress] = await factory.getDeployedCampaigns();
	campaign = await ethers.getContractAt('Campaign', campaignAddress);
});

describe('Campaigns', () => {
	it('deploys a factory and a campaign', () => {
		assert.ok(factory.address);
		assert.ok(campaign.address);
	});

	it('marks caller as the campaign manager', async () => {
		const manager = await campaign.manager();
		assert.equal(manager, owner.address);
	});

	it('allows people to contribute money and marks them as approvers', async () => {
		await campaign.connect(addr1).contribute({
			value: '200',
		});
		const isContributor = await campaign.approvers(addr1.address);
		assert(isContributor);
	});

	it('requires a minimum contribution', async () => {
		try {
			await campaign.connect(addr1).contribute({
				value: '1',
			});
		} catch (err) {
			assert(err);
		}
	});

	it('allows a manager to make a payment request', async () => {
		await campaign.createRequest('Buy batteries', '100', addr2.address);
		const request = await campaign.requests(0);
		assert.ok('Buy batteries', request.description);
		assert.ok(addr2.address, request.address);
	});

	it('retrieve campaign summary', async () => {
		const details = await campaign.getSummary();
		const [title, twitter, image, minimumContribution, balance, requestsCount, approversCount, manager] = details;
		const summary = {
			title,
			twitter,
			image,
			minimumContribution,
			balance,
			requestsCount,
			approversCount,
			manager,
		};

		console.log(details);
		assert.strictEqual(summary.title, 'it is a title');
		assert.strictEqual(summary.twitter, '@twitter');
		assert.strictEqual(summary.image, 'image.jpg');
		assert.equal(summary.minimumContribution, '100');
		assert.equal(summary.balance, '0');
		assert.equal(summary.requestsCount, '0');
		assert.equal(summary.approversCount, '0');
		assert.strictEqual(summary.manager, owner.address);
	});

	it('processes requests', async () => {
		const ethAmount = '100';
		const weiAmount = ethers.utils.parseEther(ethAmount);
		const { provider } = waffle;
		await campaign.connect(addr1).contribute({
			value: weiAmount,
		});

		let initBalance = await provider.getBalance(addr2.address);
		initBalance = ethers.utils.formatUnits(initBalance, 'ether');

		await campaign.connect(addr1).createRequest('A', weiAmount, addr2.address);
		await campaign.connect(addr1).approveRequest(0);
		await campaign.finalizeRequest(0);

		let endBalance = await provider.getBalance(addr2.address);
		endBalance = ethers.utils.formatUnits(endBalance, 'ether');

		assert(endBalance - initBalance === parseInt(ethAmount));
	});
});
