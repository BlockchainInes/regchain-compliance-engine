// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract RegChainCore is AccessControl {
    bytes32 public constant PRUEFER_ROLLE = keccak256("PRUEFER_ROLLE");
    bytes32 public constant COMPLIANCE_BEAUFTRAGTER_ROLLE = keccak256("COMPLIANCE_BEAUFTRAGTER_ROLLE");

    enum Jurisdiktion { EU, UAE, CH, GLOBAL }

    struct ComplianceBericht {
        uint256 zeitstempel;
        address einheit;
        Jurisdiktion jurisdiktion;
        uint8 risikoScore;
        bool istGenehmigt;
        string dokumentenHash;
    }

    mapping(bytes32 => ComplianceBericht) public auditProtokoll;

    event ComplianceGeloggt(bytes32 indexed txHash, address indexed einheit, Jurisdiktion jurisdiktion, uint8 risikoScore);
    event RichtlinieAktualisiert(Jurisdiktion jurisdiktion, bool aktiv);

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function loggeCompliance(
        bytes32 _txHash,
        address _einheit,
        Jurisdiktion _jurisdiktion,
        uint8 _risikoScore,
        string memory _dokumentenHash
    ) external onlyRole(COMPLIANCE_BEAUFTRAGTER_ROLLE) {
        
        auditProtokoll[_txHash] = ComplianceBericht({
            zeitstempel: block.timestamp,
            einheit: _einheit,
            jurisdiktion: _jurisdiktion,
            risikoScore: _risikoScore,
            istGenehmigt: _risikoScore < 70,
            dokumentenHash: _dokumentenHash
        });

        emit ComplianceGeloggt(_txHash, _einheit, _jurisdiktion, _risikoScore);
    }

    function holeAuditBericht(bytes32 _txHash) external view returns (ComplianceBericht memory) {
        return auditProtokoll[_txHash];
    }
}