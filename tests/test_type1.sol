//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract VulnerableContract {

    uint256 public myVariable;
    uint256 public unusedVariable;

    constructor() public {
        myVariable = 123;
    }

    function updateVariable(uint256 _newVariable) public {
        myVariable = _newVariable;
    }

    function uselessFunction() public {
        // This function has no effect
    }

    function setUnusedVariable(uint256 _unusedVariable) public {
        unusedVariable = _unusedVariable;
    }

    function getUnusedVariable() public view returns (uint256) {
        return unusedVariable;
    }
}

contract AttackerContract {
    VulnerableContract vulnerableContract;

    constructor(VulnerableContract _vulnerableContract) public {
        vulnerableContract = _vulnerableContract;
    }

    function attack() public {
        vulnerableContract.updateVariable(0);
        vulnerableContract.setUnusedVariable(0);
        vulnerableContract.myVariable;
    }
}
