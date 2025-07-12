// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract Petition {
    string[3] names;

    uint256 public nameCount;

    constructor() {
        nameCount = 0;
    }

    function registerName(string memory _name) public {
        if (nameCount < 3) {
            names[nameCount] = _name;
            nameCount++;
        }
    }

//solidity 0.8.10 e mais recentes temos a palavra reservada pure que não altera nenhuma variavel
    // function getNames() public view returns (string[3] memory) {
    //     return names;
    // }

    function getNames(uint256 _id) public view returns (string memory) {
        if(_id < 3){
            return names[_id];
        }
        return "Error: index out of bounds";
    }

    function isPetitionFull() public view returns (bool) {
        return nameCount >= 3;
    }
}
