<div id="top"></div>


[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div >

<h3 align="center">Kickstart - Smart Contract</h3>

  <p align="center">
    Solidity Smart Contract on Ethereum Blockchain.
    <br />
    <a href="https://github.com/wtakaman/kickstart-smart-contract"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/wtakaman/kickstart-smart-contract">View Demo</a>
    ·
    <a href="https://github.com/wtakaman/kickstart-smart-contract/issues">Report Bug</a>
    ·
    <a href="https://github.com/wtakaman/kickstart-smart-contract/issues">Request Feature</a>
  </p>
</div>



<!-- ABOUT THE PROJECT -->
## About The Project
Kickstart is a crowd funding smart contract implemented in Solidity.
The main goal of this project is to avoid fraud or funds miss usage that is common in Kickstarter projects.
In this proposal, campaign's contributors can opt to approve or not how the funds are spent based on the information 
provided in the expense request like description and destination address.
<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

* [Hardhat](https://hardhat.org/)
* [Infura](https://infura.io/)
* [Solidity](https://docs.soliditylang.org)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
In order to deploy the smart contract you should have an Ethereum wallet private key and some ETH funds on Goerli tesnet.

### Installation
1. Run `npm install & npm run start`

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Usage
First you need to set up:
1. Create a hardhat.config.js based on hardhat.config.example.js
2. Create an Infura account and replace the infos `ETH_WALLET_PRIVATE_KEY` and `GOERLI_INFURA URL` in hardhat.config.js file

### To run tests:
1. Run `npm run compile:hardhat`
2. Run `npm run test`

### To deploy to Goerli tesnet:
1. Run `npm run compile:goerli`
2. Run `npm run deploy:goerli`

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap
See the [open issues](https://github.com/wtakaman/kickstart-smart-contract/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

sawamu.eth - [@wtakaman](https://twitter.com/wtakaman)
Project Link: [https://github.com/wtakaman/kickstart-smart-contract](https://github.com/wtakaman/kickstart-smart-contract)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/wtakaman/kickstart-smart-contract.svg?style=for-the-badge
[contributors-url]: https://github.com/wtakaman/kickstart-smart-contract/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/wtakaman/kickstart-smart-contract.svg?style=for-the-badge
[forks-url]: https://github.com/wtakaman/kickstart-smart-contract/network/members
[stars-shield]: https://img.shields.io/github/stars/wtakaman/kickstart-smart-contract.svg?style=for-the-badge
[stars-url]: https://github.com/wtakaman/kickstart-smart-contract/stargazers
[issues-shield]: https://img.shields.io/github/issues/wtakaman/kickstart-smart-contract.svg?style=for-the-badge
[issues-url]: https://github.com/wtakaman/kickstart-smart-contract/issues
[license-shield]: https://img.shields.io/github/license/wtakaman/kickstart-smart-contract.svg?style=for-the-badge
[license-url]: https://github.com/wtakaman/kickstart-smart-contract/blob/master/LICENSE.txt
