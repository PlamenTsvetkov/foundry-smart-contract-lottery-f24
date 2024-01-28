// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;


 /// @title  A simple Raffle Contract
 /// @author Plamen Cvetkov
 /// @notice This contract is for creating a sample raffle
 /// @dev Implements Chainlink VRFv2
 
contract Riffle {
    error Raffle__NotEnoughEthSent();
    
    uint256 private immutable i_entranceFee;
    // @dev Duration of lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    /// Events
    event EnterRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval=interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough ETH sent");
        if (msg.value >= i_entranceFee){
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        // 1. Makes migration easier
        // 2. Makes front end "indexing" easier
        emit EnterRaffle(msg.sender);
    }

    // 1. Get a random number
    // 2. Use the random number to pick a player
    // 3. Be automatically called
    function pickWinnet() external {
        // check to see if enough time has passed
        if ((block.timestamp - s_lastTimeStamp) < i_interval){
                revert();
        }
    }

    /** Getter Function */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
