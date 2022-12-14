pragma solidity >=0.4.22 <0.6.0;

contract Voting {
    bytes32[] public candidateList;
    mapping(bytes32 => uint8) public votesReceived;
    constructor(bytes32[] memory candidateListName) public  {
        candidateList = candidateListName;
    }
    function validateCanditate(bytes32 candidateName)internal view returns(bool) {
        for (uint8 i =0; i < candidateList.length; i++) {
            if (candidateName == candidateList[i])
                return true;
        }
        return false;
    
    }
    function voteForCandidate(bytes32 candidateName) public {
        require(validateCanditate(candidateName));
        votesReceived[candidateName] += 1;
    }
    function totalVotesFor(bytes32 candidateName) view public returns(uint8) {
        require(validateCanditate(candidateName));
        return votesReceived[candidateName];
    }
}
