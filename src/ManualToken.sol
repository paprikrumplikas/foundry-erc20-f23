//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//we just have to implement the methods that are described in the ERC20 interface
//OR we can go to OpenZeppelin

contract ManualToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether; //10^20 == since solidity does not have decimals, we should create a decimals function
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        //holding tokens of an erc20 means you have a balance of some mapping in a contract
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount; //assign these mappings
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
