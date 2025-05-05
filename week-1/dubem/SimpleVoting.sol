// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Voting {
    //setting state variables//
    address public immutable owner;
     //define candidates data//
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
      //array to store candidates list//
    Candidate[] public candidates;
      //mapping to keep record of vote based on bool value//
    mapping(address => bool) public hasVoted;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
      //add candidate to array list//
    function addCandidate(string memory _name) public onlyOwner {
        candidates.push(Candidate({
            id: candidates.length,
            name: _name,
            voteCount: 0
        }));
    }
       //vote for candidate//
    function vote(uint _candidateId) public {
        //check if voter has voted previously//
        require(!hasVoted[msg.sender], "You have already voted.");
        //checks that candidate id matches the array length//
        require(_candidateId < candidates.length, "Invalid candidate ID.");

        candidates[_candidateId].voteCount += 1;
        hasVoted[msg.sender] = true;
    }
       //get candidate vote count//
    function getCandidate(uint _candidateId) public view returns (string memory name, uint voteCount) {
        require(_candidateId < candidates.length, "Invalid candidate ID");
        Candidate memory can = candidates[_candidateId];
        return (can.name, can.voteCount);
    }
       //get all candidates data//
    function getAllCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    function winner() public view returns (string memory winnerName, uint highestVotes) {
        uint maxVotes = 0;
        uint winnerIndex = 0;
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }
        return (candidates[winnerIndex].name, maxVotes);
    }
}