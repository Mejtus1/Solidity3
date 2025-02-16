// code lines from 273 - 288

// this part of code handles SWAP and LIQUIDITY of Token 
// (when and how are tokens swapped on Uniswap)

//----------------------------------------------------------------------------------------------//
// Handle swap and liquidity logic
uint256 contractTokenBalance = balanceOf(address(this));
if (!x3PLTYQ8 && to == uniswapV2Pair && swapEnabled && contractTokenBalance > _x6NRWPX4 && _buyCount > _x1PLYT8F9) {
if (block.number > lastSellBlock) {
sellCount = 0;
}
require(sellCount < 3, "Only 3 sells per block!");
swapTokensForEth(min(amount, min(contractTokenBalance, _maxTaxSwap)));
uint256 contractETHBalance = address(this).balance;
if (contractETHBalance > 0) {
sendETHToFee(address(this).balance);
}
sellCount++;
lastSellBlock = block.number;
}
//----------------------------------------------------------------------------------------------//

// Key variables in this code block 

contractTokenBalance: 
// stores balance of contract (amount of tokens that contract itself holds)
x3PLTYQ8: 
// variable servign as a flag used for locking swap to prevent reentrancy attacks (boolean value true or false)
to == uniswapV2Pair: 
// checks if recipient of tokens is Uniswap trading pair (typically, this would be liquidity pool where tokens are swapped for ETH)
swapEnabled: 
// flag that controls whether token swapping feature is active
_x6NRWPX4: 
// threshold amount for minimum contract token balance required to trigger the swap
_buyCount > _x1PLYT8F9: 
// Ensures that this action only happens after certain number of buys have occurred. 
// _x1PLYT8F9 is some threshold to restrict when swaps can happen.
sellCount: 
// counter to track how many times tokens have been sold in current block.
lastSellBlock: 
// Stores block number when last sell transaction occurred to ensure no more than set number of sells per block.
_maxTaxSwap: 
// limit on maximum amount of tokens that can be swapped in a single transaction.

