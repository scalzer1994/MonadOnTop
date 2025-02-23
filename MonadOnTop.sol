// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MonadOnTop is ERC20, Ownable, ERC20Permit {
    string public greeting;

    constructor(address initialOwner, string memory _greeting)
        ERC20("monad on top", "MND")
        Ownable(initialOwner)
        ERC20Permit("monad on top")
    {
        _mint(initialOwner, 2000 * 10 ** decimals());
        greeting = _greeting;
    }

    function setGreeting(string calldata _greeting) external onlyOwner {
        greeting = _greeting;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
