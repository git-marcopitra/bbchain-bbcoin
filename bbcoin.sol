pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BBCOIN is ERC20 {
    string public constant NAME = "BBCOIN";
    string public constant SYMBOL = "BBC";
    uint8 public constant DECIMALS = 18;
    uint256 public constant INITIAL_SUPPLY = 1000000 * 10**uint256(DECIMALS);
    uint256 public constant BRL_PER_TOKEN = 1; // 1 token BBCOIN equivale a 1 real

    constructor() ERC20(NAME, SYMBOL) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function buyTokens(uint256 amountInBRL) public {
        uint256 amountInTokens = amountInBRL / BRL_PER_TOKEN;
        _transfer(address(this), msg.sender, amountInTokens);
    }

    function sellTokens(uint256 amountInTokens) public {
        uint256 amountInBRL = amountInTokens * BRL_PER_TOKEN;
        _transfer(msg.sender, address(this), amountInBRL);
    }
}
