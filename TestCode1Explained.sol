// Code lines from 247 - 257 

//----------------------------------------------------------------------------------------------//
// Check if this is a new unique buyer within the first 28 buys
if (from == uniswapV2Pair && to != address(uniswapV2Router) && !_isExcludedFromFee[to] && !initialBuyers[to]) {
currentBuyCount++;
initialBuyers[to] = true;

// Automatically blacklist the address if within the first 28 buys
if (currentBuyCount <= blacklistCount) {
bots[to] = true;
emit Transfer(from, to, 0); // Optionally emit a zero transfer as a way to signal the blacklist
}
}
//----------------------------------------------------------------------------------------------//


// Check if this is a new unique buyer within the first 28 buys
if (from == uniswapV2Pair && to != address(uniswapV2Router) && !_isExcludedFromFee[to] && !initialBuyers[to]) {
currentBuyCount++;
initialBuyers[to] = true;

// Tracking Unique Buyers
from == uniswapV2Pair: 
// condition ensures that transaction is buy
// transaction originates from Uniswap pair (i.e., the liquidity pool) 
// sender (from) is Uniswap pair address
// &&
!= address(uniswapV2Router): 
// condition ensures recipient (to) is not Uniswap router contract
// router is part of transaction path but is not considered "real buyer" in this context
// &&
!_isExcludedFromFee[to]: 
// checks if buyer (to) is not excluded from fees. 
// xcluded addresses = privileged addresses (owner or liquidity pools) that are not subject to same rules
// &&
!initialBuyers[to]: 
// - ensures that buyer hasn't already been marked as buyer in previous transactions
// - it avoids re-processing same buyer multiple times

// CONDITIONS ARE MET 
// if all these conditions are met, it means this is new unique buyer who is interacting with contract by purchasing tokens

// The code then:
currentBuyCount++: 
// Increases counter currentBuyCount, 
// keeping track of how many unique buyers have made purchase so fa
initialBuyers[to] = true;
// Marks address to as unique buyer, ensuring that this address won't be counted again in future

