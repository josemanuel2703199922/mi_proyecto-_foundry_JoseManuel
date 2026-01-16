// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MiPrimerToken.sol";

contract MiPrimerTokenTest is Test {
    MiPrimerToken token;
    address owner = address(this);
    address usuario = address(0xABC);

    function setUp() public {
        token = new MiPrimerToken();
    }

    // AÑADIMOS 'view' AQUÍ PARA QUITAR EL WARNING
    function test_InitialSupply() public view {
        assertEq(token.totalSupply(), 1000000 * 10**18);
    }

    function test_MintAsOwner() public {
        token.mint(usuario, 500 * 10**18);
        assertEq(token.balanceOf(usuario), 500 * 10**18);
    }

    function test_PausePreventsTransfer() public {
        token.pause();
        vm.expectRevert(); 
        token.transfer(usuario, 100);
    }

    function test_Burn() public {
        uint256 supplyBefore = token.totalSupply();
        token.burn(100 * 10**18);
        assertEq(token.totalSupply(), supplyBefore - (100 * 10**18));
    }
}