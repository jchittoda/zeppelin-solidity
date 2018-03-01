pragma solidity ^0.4.18;

import "./StandardToken.sol";

/**
 * @title Restrict sending ERC20 tokens to self
 * @dev This contract will restrict users to wrongly send tokens to self Token Contract.
 */
contract RestrictTransferToSelf is StandardToken {
    
    function transfer(address _to, uint256 _value) public returns (bool) {
		require(_to != address(this));

        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(this));

        return super.transferFrom(_from, _to, _value);
    }
}