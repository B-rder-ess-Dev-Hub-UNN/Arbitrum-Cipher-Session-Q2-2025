// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Voting {
    struct Candidate {
        uint256 ID;
        string name;
        address candidateaddress;
        // another to track vote count
        uint256 nbVotes;
    }
    Candidate[] candidates;

    //mapping
    mapping(address => bool) public isVoted;

    uint256 public candidateIndex = 0;

    //immutables
    address public immutable owneraddress;

    //contructor
    constructor() {
        owneraddress = msg.sender;
    }

    //modifier
    modifier onlyowneraddress() {
        require(msg.sender == owneraddress, "only owner is allowed");
        _;
    }

    //  _index public candidateIndex

    //add candidates
    function addCandidate(string memory _name, address _candidateaddress)
        public
        onlyowneraddress
    {
        // create candidate
        Candidate memory candidate;
        candidate.ID = candidates.length;
        candidate.name = _name;
        candidate.candidateaddress = _candidateaddress;

        // add candidate to candidates array
        candidates.push(candidate);
    }

    //voting function
    function candidateVote(uint256 _index) public {
        // check if msg.sender has voted before
        require(!isVoted[msg.sender], "user has already voted");
        isVoted[msg.sender] = true;

        // check if candidiate index is not out of bound (> candidates.length)
        require(_index < candidates.length, "invalid index");
        Candidate storage candidiate = candidates[_index];
        ++candidiate.ID;

        // update candidate vote
        candidates[candidateIndex].nbVotes++;

        // mark msg.sender as voted
        isVoted[msg.sender] = true;
    }

    function getCandidate(uint256 _index)
        public
        view
        returns (string memory _name, address _candidateaddress)
    {
        // take in index
        require(_index < candidates.length, "invalid candidate");
        Candidate storage candidate = candidates[_index];

        // return the candidate info
        return (candidate.name, candidate.candidateaddress);
    }

    function getAllCandidate() public view returns (Candidate[] memory) {
        return candidates;
    }

    //get winner
    function getwinner()
        public
        view
        returns (
            uint256,
            string memory,
            address
        )
    {
        // get candidate with max vote
        Candidate memory winner;

        require(candidates.length > 0, "no candidates");

        for (uint256 i = 0; i < candidates.length; ++i) {
            Candidate memory candidate = candidates[i];

            if (candidate.nbVotes > winner.nbVotes) {
                winner = candidate;
            }
        }

        // return candidate info
        return (winner.ID, winner.name, winner.candidateaddress);
    }
}
