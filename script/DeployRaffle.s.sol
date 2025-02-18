// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Raffle} from "../src/Raffle.sol";
import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        (
            uint256 enteranceFee,
            uint256 interval,
            bytes32 gasLane,
            uint32 subscriptionId,
            uint32 callbackGasLimit,
            address vrfCoordinator
        ) = helperConfig.activeNetwork();
        vm.startBroadcast();
        Raffle raffle = new Raffle(enteranceFee, interval, gasLane, subscriptionId, callbackGasLimit, vrfCoordinator);
        vm.stopBroadcast();
        return (raffle, helperConfig);
    }
}
