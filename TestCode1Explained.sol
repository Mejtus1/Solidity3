// Code lines from 247 - 257 

// This code snippet implements a mechanism to:

// Track the first 28 unique buyers in the system.
// Automatically blacklist those buyers (marking them as "bots") to restrict their actions.
// Emit a Transfer event with a value of 0 as a way to log the blacklist action.
// prevent certain buyers, typically within first batch of transactions, from interacting further with contract. 
// This could be used as mechanism to combat bots or unfair trading behavior during early phases of token launch or specific transaction period.

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



// Automatically blacklist the address if within the first 28 buys
if (currentBuyCount <= blacklistCount) {
bots[to] = true;
emit Transfer(from, to, 0); // Optionally emit a zero transfer as a way to signal the blacklist
}
}

// Once unique buyer is identified, contract proceeds to automatically blacklist certain buyers within first 28 purchases:

if (currentBuyCount <= blacklistCount): 
// condition checks if current buyer is within first 28 buyers. 
// If currentBuyCount is less than or equal to blacklistCount (which is set to 28 in contract), then this buyer gets blacklisted.

bots[to] = true;: 
// This line adds address to (new buyer) to bots mapping. 
// bots mapping is used to mark addresses that are considered "bad actors" or addresses that are blacklisted. 
// Blacklisted addresses are typically restricted from certain actions, such as making further transactions or transfers

emit Transfer(from, to, 0);: 
// This emits transfer event with value of 0. 
// The event does not transfer any actual tokens but serves as signal or notification that buyer has been blacklisted. 
// This could be useful for tracking or notifying off-chain systems about blacklist action.
