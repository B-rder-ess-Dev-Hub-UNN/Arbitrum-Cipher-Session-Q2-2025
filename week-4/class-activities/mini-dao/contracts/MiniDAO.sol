// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/AccessControl.sol";

// User Roles
// admin
// member
contract MiniDAO is AccessControl {
    // Proposal
    struct Proposal {
        uint id;
        string title;
        string description;
        address proposer;
        uint voteCount;
        uint yesCount;
        uint noCount;
        uint deadline;
        ProposalStatus status;
    }

    enum ProposalStatus {
        Active,
        Executed,
        Rejected
    }

    Proposal[] public proposals;

    mapping(address => mapping(uint => bool)) public hasVoted;

    bytes32 public constant MEMBER_ROLE = keccak256("MEMBER_ROLE");

    event MemberRegistered(address indexed member);
    event ProposalCreated(
        uint indexed proposalId,
        string title,
        string description,
        address indexed proposer
    );
    event VoteCast(
        uint indexed proposalId,
        address indexed voter,
        bool support
    );
    event ProposalExecuted(uint indexed proposalId);
    event ProposalRejected(uint indexed proposalId);

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MEMBER_ROLE, msg.sender);

        emit MemberRegistered(msg.sender);
    }

    function registerMember(
        address member
    ) public onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(MEMBER_ROLE, member);

        emit MemberRegistered(member);
    }

    function checkIsMember(address member) public view returns (bool) {
        return hasRole(MEMBER_ROLE, member);
    }

    function createProposal(
        string memory _title,
        string memory _description,
        uint deadline // in seconds
    ) public onlyRole(MEMBER_ROLE) {
        uint proposalId = proposals.length;

        proposals.push(
            Proposal({
                id: proposalId,
                title: _title,
                description: _description,
                proposer: msg.sender,
                voteCount: 0,
                yesCount: 0,
                noCount: 0,
                deadline: block.timestamp + deadline,
                status: ProposalStatus.Active
            })
        );

        emit ProposalCreated(proposalId, _title, _description, msg.sender);
    }

    function getProposal(
        uint proposalId
    ) public view returns (Proposal memory) {
        require(proposalId < proposals.length, "Proposal does not exist");
        return proposals[proposalId];
    }

    function getProposalCount() public view returns (uint) {
        return proposals.length;
    }

    function vote(
        uint proposalId,
        bool support // true for yes, false for no
    ) public onlyRole(MEMBER_ROLE) {
        // make sure proposal exists
        require(proposalId < proposals.length, "Proposal does not exist");
        // make sure the member has not voted on this proposal
        require(
            !hasVoted[msg.sender][proposalId],
            "Member has already voted on this proposal"
        );

        Proposal storage proposal = proposals[proposalId];

        if (block.timestamp > proposal.deadline) {
            revert("Voting period has ended");
        }

        if (proposal.status != ProposalStatus.Active) {
            revert("Proposal is not active");
        }

        proposal.voteCount += 1;

        if (support) {
            proposal.yesCount += 1;
        } else {
            proposal.noCount += 1;
        }

        hasVoted[msg.sender][proposalId] = true;
        emit VoteCast(proposalId, msg.sender, support);
    }

    function executeProposal(
        uint proposalId
    ) public onlyRole(DEFAULT_ADMIN_ROLE) {
        require(proposalId < proposals.length, "Proposal does not exist");

        Proposal storage proposal = proposals[proposalId];

        require(
            proposal.status == ProposalStatus.Active,
            "Proposal is not active"
        );

        require(
            block.timestamp > proposal.deadline,
            "Voting period has not ended"
        );

        require(proposal.yesCount > proposal.noCount, "Proposal did not pass");

        proposal.status = ProposalStatus.Executed;

        emit ProposalExecuted(proposalId);
    }

    function rejectProposal(
        uint proposalId
    ) public onlyRole(DEFAULT_ADMIN_ROLE) {
        require(proposalId < proposals.length, "Proposal does not exist");

        Proposal storage proposal = proposals[proposalId];

        require(
            proposal.status == ProposalStatus.Active,
            "Proposal is not active"
        );

        require(
            block.timestamp > proposal.deadline,
            "Voting period has not ended"
        );

        proposal.status = ProposalStatus.Rejected;

        emit ProposalRejected(proposalId);
    }
}
