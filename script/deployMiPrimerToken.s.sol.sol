// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/MiPrimerToken.sol";

contract DeployMiPrimerToken is Script {
    function run() external {
        // Carga la clave privada del archivo .env
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        // Despliegue del contrato
        new MiPrimerToken();

        vm.stopBroadcast();
    }
}