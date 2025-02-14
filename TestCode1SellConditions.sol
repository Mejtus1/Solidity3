// Code lines from 259 to 271 
// Also Code lines from 138 to 154 (Code interacts with these particular set values written into code)

// logic that manages transaction taxes, limits, and conditions based on transaction type (buying, selling) and certain thresholds

//----------------------------------------------------------------------------------------------//
// Lines 138 to 154 
uint256 private _0xFTXZ2089=18;
uint256 private _x3KLVQ5093=18;
uint256 private _x7PRXTZ=0;     // used in function as parameter for 0% tax exchange rate  
uint256 private _x5NLYW9028=0;
uint256 private _x2BQVT653=18;
uint256 private _xGRWZ17=18;
uint256 private _x1PLYT8F9=18;
uint256 private _buyCount=0;

uint8 private constant _decimals = 9;
uint256 private constant _tTotal = 100_000_000 * 10**_decimals;
string private _name;
string private _symbol;
uint256 public _x5KQZL9T3 = _tTotal * 2 / 100;   // Used in function as parameter of max buy for single wallet 
uint256 public _x0BRXT5K7 = _tTotal * 2 / 100;   // Used in function as parameter like one above, but for boolean condition after wallet buys to make sure it doesnt hold more than 2% of supply
uint256 public _x6NRWPX4 = _tTotal * 1 / 100;
uint256 public _maxTaxSwap = _tTotal * 1 / 100;
//----------------------------------------------------------------------------------------------//
//----------------------------------------------------------------------------------------------//
// Lines 259 to 271 
// Regular tax logic after the blacklist phase
taxAmount = amount.mul((_buyCount > _x2BQVT653) ? _x7PRXTZ : _0xFTXZ2089).div(100);

if (from == uniswapV2Pair && to != address(uniswapV2Router) && !_isExcludedFromFee[to]) {
require(amount <= _x5KQZL9T3, "Exceeds the _x5KQZL9T3.");
require(balanceOf(to) + amount <= _x0BRXT5K7, "Exceeds the x0BRXT5K7.");
_buyCount++;
}

// Additional sell conditions (if needed)
if (to == uniswapV2Pair && from != address(this)) {
taxAmount = amount.mul((_buyCount > _xGRWZ17) ? _x5NLYW9028 : _x3KLVQ5093).div(100);
}
//----------------------------------------------------------------------------------------------//

// Regular Tax Logic After the Blacklist Phase
taxAmount = amount.mul((_buyCount > _x2BQVT653) ? _x7PRXTZ : _0xFTXZ2089).div(100);
// calculates tax amount for transaction. 
// tax is applied based on conditional logic related to number of buys made and threshold (_x2BQVT653).

amount.mul(...).div(100): 
// calculates tax amount by multiplying transaction amount (amount) by tax percentage and then dividing by 100 to get correct tax value.
_buyCount > _x2BQVT653: 
// checks whether number of buys (_buyCount) exceeds threshold (_x2BQVT653). 
// Initially, _x2BQVT653 is set to 18, so this condition will evaluate whether number of buys surpasses 18.
? _x7PRXTZ : _0xFTXZ2089: 
// ternary operator
// If condition (_buyCount > _x2BQVT653) is true, it uses value of _x7PRXTZ, which is set to 0, meaning no tax will be applied. 
// Otherwise, it uses _0xFTXZ2089, which is set to 18, implying a tax rate of 18% will be applied.

// So, if the number of buys is greater than 18, no tax is applied. Otherwise, the tax is 18%.



if (from == uniswapV2Pair && to != address(uniswapV2Router) && !_isExcludedFromFee[to]) {
require(amount <= _x5KQZL9T3, "Exceeds the _x5KQZL9T3.");
require(balanceOf(to) + amount <= _x0BRXT5K7, "Exceeds the x0BRXT5K7.");
_buyCount++;
}
// This block ensures that new buyers are subject to limits on amount they can buy, and it enforces some basic conditions for those transactions:

from == uniswapV2Pair: 
// checks if transaction is originating from Uniswap pair (i.e., a buy transaction).
to != address(uniswapV2Router): 
// ensures that transaction is not going to Uniswap router, which is part of transaction path but is not "real buyer."
!_isExcludedFromFee[to]: 
// ensures that buyer is not excluded from fees (like privileged addresses such as owner).
require(amount <= _x5KQZL9T3, "Exceeds the _x5KQZL9T3.");: 
// This condition ensures that amount being bought does not exceed specific threshold. 
// _x5KQZL9T3 is set to 2% of total supply (_tTotal), it limits buy amount to certain percentage of total supply.
require(balanceOf(to) + amount <= _x0BRXT5K7, "Exceeds the x0BRXT5K7.");: 
// condition ensures that buyer’s total balance after transaction does not exceed another limit (_x0BRXT5K7), which is set to 2% of total supply (_tTotal). 
// prevents buyer from accumulating too many tokens in single purchase.
_buyCount++;: 
// increments buy counter (_buyCount) for every valid buy transaction, tracking number of buys.



// Additional sell conditions (if needed)
if (to == uniswapV2Pair && from != address(this)) {
taxAmount = amount.mul((_buyCount > _xGRWZ17) ? _x5NLYW9028 : _x3KLVQ5093).div(100);
}
// code deals with applying different tax rates when selling tokens:
to == uniswapV2Pair: 
// This condition checks if transaction is sell (because tokens are being sent to Uniswap pair, liquidity pool).
from != address(this): 
// Ensures that sell is not originating from contract itself (which would likely be related to liquidity or tax handling, not normal user transaction).
taxAmount = amount.mul((_buyCount > _xGRWZ17) ? _x5NLYW9028 : _x3KLVQ5093).div(100);: 
// This sets sell tax based on similar conditional logic:
//1. If number of buys (_buyCount) exceeds _xGRWZ17 (which is initially set to 18), tax rate used is _x5NLYW9028, which is set to 0%. 
// This means that after a certain number of buys, no tax is applied on sells.
//2. If _buyCount is less than or equal to _xGRWZ17, tax rate applied will be _x3KLVQ5093, which is set to 18%. 
// This means that during early stages of trading (fewer buys), higher sell tax is applied.
