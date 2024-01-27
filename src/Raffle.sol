// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/**
 * @title  A simple Raffle Contract
 * @author Plamen Cvetkov
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2
 */
contract Riffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee){
        i_entranceFee=entranceFee;
    }

    function enterRaffle()  public payable{
        
    }
    
    function pickWinnet()  public {
        
    }

    /** Getter Function */

    function getEntranceFee()  external view returns (uint256) {
        return i_entranceFee;
    }
}
