// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4 <0.9.0;


contract SolMining {
    // Declare a struct for the mining account
    struct MiningAccount {
        uint256 tokensMined;
    }

    // Mapping to store mining accounts by user address
    mapping(address => MiningAccount) public miningAccounts;

    // Event emitted when tokens are mined
    event TokensMined(address indexed user, uint256 tokensMined);

    // Function to initialize a new mining account
    function initialize() external {
        require(miningAccounts[msg.sender].tokensMined == 0, "Mining account already initialized.");
        miningAccounts[msg.sender] = MiningAccount({
            tokensMined: 0
        });
    }

    // Function to mine tokens
    function mineTokens() external {
        MiningAccount storage miningAccount = miningAccounts[msg.sender];
        
        // If the account is not initialized, initialize it
        if (miningAccount.tokensMined == 0) {
            miningAccount.tokensMined = 0;
        }

        // Increase the mined tokens by 1
        miningAccount.tokensMined += 1;

        // Emit an event for the token mining
        emit TokensMined(msg.sender, miningAccount.tokensMined);
    }

    // Function to get the number of tokens mined by a user
    function getTokensMined(address user) external view returns (uint256) {
        return miningAccounts[user].tokensMined;
    }
}
