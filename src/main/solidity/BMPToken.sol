pragma solidity ^0.4.18;

contract BMPToken is ERC223 {

	// Public fields:
	uint8 public constant decimals = 0;
	string public constant symbol = "BXL";
	string public constant name = "Brussels Mining Project Token";

	// Private fields:
	uint private _totalSupply = 0;
	mapping (address => uint) balances;
 	mapping (address => mapping (address => uint)) allowed;

	// Events:
	event tokenMinted (address _beneficiary, uint _value); 

	// Constructor:
	function BMPToken () 
		public 
		Owned (msg.sender) {
	}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

	// Mint method:
	function mint (address _beneficiary, uint _value) 
		public
		onlyOwner 
		returns (bool success) {

		// @TODO Check overload

		// Mint the token:
		_totalSupply += _value;

		// Credit the beneficary:
		balances[_beneficiary] += _value;

		// Signal the new token(s) minted:
		tokenMinted (_beneficiary, _value);

		// Everything is fine:
		return true;
	}

	function balance () 
		public 
		constant 
		returns (uint balance) {

		return balances[msg.sender];
	}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - [ERC20] - -

	// Returns the total supply of token:
	function totalSupply () 		
		public
		constant 
		returns (uint totalSupply) {

		return _totalSupply;
	}

	function balanceOf (address _owner) 
		public 
		constant 
		returns (uint balance) {

		return balances[_owner];
	}

	function transfer (address _to, uint _value) 
		returns (bool success);	


	function transferFrom (address _from, address _to, uint _value);

	function approve      (address _spender, uint _value) 
		returns (bool success) {
			allowed[msg.sender][_spender] = _value;
			Approval(msg.sender, _spender, _value);
        	return true;
    }


	function allowance (address _owner, address _spender) 
		constant 
		returns (uint remaining) {

		return allowed[_owner][_spender];
	}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - [ERC223]  -



}