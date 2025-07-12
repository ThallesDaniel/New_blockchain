// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract Petition2 {
    string[3] private names;
    string[] private extraNames;

    uint256 public nameCount;

    mapping (uint256 => string) public status;

    constructor() {
        nameCount = 0;
    }

    function registerName(string memory _name) public {
        if (nameCount < 3) {
            names[nameCount] = _name;
        }else{
            extraNames.push(_name);
        }
        status[nameCount] = "Undefined";
        nameCount++;
    }

    function getNames(uint256 _id) public view returns (string memory) {
        if(_id < 3){
            return names[_id];
        }
        return "Error: index out of bounds";
    }

    function isPetitionFull() public view returns (bool) {
        return nameCount >= 3;
    }

   function changeStatus(uint256 _id, string memory _status) public {
        // Verifica se o ID é válido e se o status atual NÃO é "Undefined"
        // Comparação de hashes é a forma mais eficiente de verificar igualdade de strings em Solidity
        // Uma vez que a linguagem NÃO possui o atributo ''.contains'' por natureza
        if (_id < 3 && keccak256(abi.encodePacked(status[_id])) != keccak256(abi.encodePacked("Undefined"))) {
            status[_id] = _status;
        }
    }
}