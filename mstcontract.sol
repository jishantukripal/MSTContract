// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    string public name;                            // Token Name
    string public symbol;                          // Token Abbreviation
    uint256 public totalSupply;                     // Total Supply

    mapping(address => uint256) public balances;   // Mapping of addresses to balances

    // Constructor
    constructor() {
        name = "Metacraft Solidity Token";
        symbol = "MST";
        totalSupply = 21000 * 10**18;            // Total supply of 21 million coins with 18 decimal places
        balances[msg.sender] = totalSupply;         // Assign the total supply to the contract deployer's balance
    }

    // Mint function
    function mint(address recipient, uint256 value) public {
        totalSupply += value;                        // Increase the total supply by the specified value
        balances[recipient] += value;                 // Increase the balance of the recipient by the specified value
    }

    // Burn function
    function burn(address sender, uint256 value) public {
        require(balances[sender] >= value, "Insufficient balance"); // Check if the sender has enough balance

        totalSupply -= value;                        // Decrease the total supply by the specified value
        balances[sender] -= value;                    // Decrease the balance of the sender by the specified value
    }
}
