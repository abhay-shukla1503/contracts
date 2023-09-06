// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Smart is ERC20, Ownable {
    uint256 public tokenPrice;
    uint256 LastMintTime;
    uint limit= 400000;
    uint phase=1;
    constructor() ERC20("getSmart", "GETS") {
        tokenPrice = 0.1 ether;
    }

    function mint() public onlyOwner {
        uint256 a=block.timestamp;
        require(a-LastMintTime>= 15 minutes,"Minting is not completed");
        require(limit>= 0,"Limit Reached");
        LastMintTime=a;
        phase++;
        _mint(msg.sender, limit);
        limit/=2;
    }
}