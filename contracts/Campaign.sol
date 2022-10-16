// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";

// @title Kickstart smart contract factory
// @author wtakaman
// @notice Smart Contract Factory
contract CampaignFactory {
    event NewCampaign(string title, string twitter, string image, uint minimum, address owner);

    // deployed campaigns
    address[] public deployedCampaigns;

    // @notice creates a new Kickstart smart contract campaign
    // @param title
    // @param twitter
    // @param image
    // @return
    function createCampaign(
        string memory title,
        string memory twitter,
        string memory image,
        uint minimum
    ) public {
        Campaign newCampaign = new Campaign(title, twitter, image, minimum, msg.sender);
        deployedCampaigns.push(address(newCampaign));

        // emits a new campaign created in the network
        emit NewCampaign(title, twitter, image, minimum, msg.sender);
    }

    // @notice return all created campaigns by this smart contract factory
    // @return list of smart contract campaigns
    function getDeployedCampaigns() public view returns (address[] memory) {
        return deployedCampaigns;
    }
}

// @notice Kickstart campaign
// @author wtakaman
contract Campaign {
    // @notice struct that defines a kickstart campaign expense
    struct Request {
        string description;
        uint value;
        address payable recipient;
        bool complete;
        uint approvalsCount;
        mapping(address => bool) approvals;
    }

    uint public requestsCount;
    address public manager;
    string public title;
    string public twitter;
    string public image;
    uint public minimumContribution;
    uint public approversCount;
    string public status;
    mapping(address => bool) public approvers;
    mapping(uint => Request) public requests;

    // @notice defines the creation of the kickstart campaign
    // @param pTitle title of the campaign
    // @param pTwitter twitter account handle
    // @param pImage link to the image in ipfs
    // @param pMinimum minimum contribution amount
    // @param pCreator smart contract creator
    constructor(
        string memory pTitle,
        string memory pTwitter,
        string memory pImage,
        uint pMinimum,
        address pCreator
    ) {
        title = pTitle;
        twitter = pTwitter;
        image = pImage;
        manager = pCreator;
        minimumContribution = pMinimum;
    }

    // @notice defines the creation a campaign expense
    // @param pDescription title of the campaign
    // @param pTwitter twitter account handle
    // @param pImage link to the image in ipfs
    function createRequest(
        string memory pDescription,
        uint pValue,
        address payable pRecipient
    ) public {
        Request storage r = requests[requestsCount++];
        r.description = pDescription;
        r.value = pValue;
        r.recipient = pRecipient;
        r.complete = false;
        r.approvalsCount = 0;
    }

    // @notice approves a campaign expense proposed by Campaign creator.
    // Only allowed for the creator of the campaign
    // @param request index/identifier
    function approveRequest(uint index) public {
        Request storage request = requests[index];
        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);

        request.approvals[msg.sender] = true;
        request.approvalsCount++;
    }

    // @notice finalize the expense request and sends the amount to destination address.
    // Only allowed for the creator of the campaign
    // @param request index/identifier
    function finalizeRequest(uint index) public payable restricted {
        Request storage request = requests[index];
        require(request.approvalsCount > (approversCount / 2));
        require(!request.complete);

        request.complete = true;
        request.recipient.transfer(request.value);
    }

    // @notice contribute to the campaign if minimum amount is met
    function contribute() public payable {
        require(msg.value >= minimumContribution);
        approvers[msg.sender] = true;
        approversCount++;
    }

    // @notice get details of the campaign
    function getSummary()
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint,
            uint,
            uint,
            uint,
            address
        )
    {
        return (title, twitter, image, minimumContribution, address(this).balance, requestsCount, approversCount, manager);
    }

    // @notice change the status of the campaign.
    // Only allowed for the creator of the campaign
    // @param newStatus the new status to be assigned
    function changeStatus(string memory newStatus) public restricted {
        status = newStatus;
    }

    // @notice method modifier to control smart contract's creator only access
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
}
