//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//intall: forge install OpenZeppelin/openzeppelin-contracts --no-commit
//solmate is also a very good library with pre-built contracts
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MT") {
        //if we inherit from another contract which has a constructor, we need to pass the args for that here
        _mint(msg.sender, initialSupply); //mint is a function from ERC20
    }
}
