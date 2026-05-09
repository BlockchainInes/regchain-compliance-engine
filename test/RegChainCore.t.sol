// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../contracts/RegChainCore.sol";

contract RegChainCoreTest is Test {
    RegChainCore public core;
    address admin = address(this); 
    address complianceOffizier = address(0xBEEF);

    function setUp() public {
        core = new RegChainCore();
        core.grantRole(core.PRUEFER_ROLLE(), complianceOffizier);
        core.grantRole(core.COMPLIANCE_BEAUFTRAGTER_ROLLE(), complianceOffizier);
    }

    function testLoggeCompliance() public {
        vm.startPrank(complianceOffizier);
        
        bytes32 txHash = keccak256("PROJEKT_ALPHA");
        core.loggeCompliance(
            txHash, 
            address(0x123), 
            RegChainCore.Jurisdiktion.EU, 
            50, 
            "ipfs://mein-bericht"
        );
        
        RegChainCore.ComplianceBericht memory bericht = core.holeAuditBericht(txHash);
        assertEq(bericht.risikoScore, 50);
        assertTrue(bericht.istGenehmigt);
        
        vm.stopPrank();
    }
}