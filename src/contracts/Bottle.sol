// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "https://github.com/exo-digital-labs/ERC721R/blob/main/contracts/ERC721A.sol";
import "https://github.com/exo-digital-labs/ERC721R/blob/main/contracts/IERC721R.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Bottle is ERC721A, Ownable {
    // price of the nft
    uint256 constant mintPrice = 0.0001 ether;
    // maximum user can mint nft
    uint256 constant maxMintPerUser = 1;
    // max supply 
    uint256 public constant MAX_SUPPLY = 4;
    // period for user want to refund
    uint256 constant refundPeriod = 3 minutes;
    address public refundAddress;
    // timestamp
    uint256 public timenow = block.timestamp;
    mapping(uint256 => uint256) public refundEndTimestamps;
    uint256 public refundEndTimestamp;

    mapping(uint256 => bool) public hasRefunded;

    constructor()
        ERC721A("Bottle", "BTTL")
        Ownable(msg.sender)
    {
        refundAddress = address(this);
        refundEndTimestamp = block.timestamp + refundPeriod;

    }

    // // metadata URI
  string private _baseTokenURI;

  function _baseURI() internal view virtual override returns (string memory) {
    return _baseTokenURI;
  }

  function setBaseURI(string calldata baseURI) external onlyOwner {
    _baseTokenURI = baseURI;
  }


    function safeMint() public payable  {
        require(msg.value == mintPrice, "not enought funds");
        require(_numberMinted(msg.sender) < maxMintPerUser, "Mint Limit 1 per wallet");
        require(_totalMinted() < MAX_SUPPLY, "NFT MAX SUPPLY 4");
        _safeMint(msg.sender,1);
        refundEndTimestamp = block.timestamp + refundPeriod;
        for (uint256 i = _currentIndex - 1; i < _currentIndex; i++) {
            refundEndTimestamps[i] = refundEndTimestamp;
        }
    }

    function refund(uint256 tokenId) external {
        require(block.timestamp < getRefundDeadline(tokenId), "Refund Period Expired");
        require(msg.sender == ownerOf(tokenId), "Not Your NFT");
        uint256 refundAmount = getRefundAmount(tokenId);
        // transfetr ownership of nft
        _transfer(msg.sender, refundAddress, tokenId );
        // mark refunded
        hasRefunded[tokenId] = true;
        // refund the price
        Address.sendValue(payable (msg.sender), refundAmount);
    
    }

    function getRefundDeadline(uint256 tokenId) public view returns(uint256) {
        if (hasRefunded[tokenId]) {
            return 0;
        }
        return refundEndTimestamps[tokenId];  
    }


    function getRefundAmount(uint256 tokenId) public view returns(uint256) {
        if (hasRefunded[tokenId]) {
            return 0;
        }

        return mintPrice;
    }

    function withdraw() external onlyOwner {
        require(block.timestamp > refundEndTimestamp, "it is not past the refund period");
        uint256 balance = address(this).balance;
        Address.sendValue(payable(msg.sender),balance);
    }

    


}
