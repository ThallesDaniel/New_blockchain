// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract Petition {
    string[3] names;

    uint256 public nameCount;

    mapping (uint256 => string) public status;

    constructor() {
        nameCount = 0;
    }

    function registerName(string memory _name) public {
        if (nameCount < 3) {
             status[nameCount] = "Undefined";
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

   function changeStatus(uint256 _id, string memory _status) public {
        // Verifica se o ID é válido e se o status atual NÃO é "Undefined"
        // Comparação de hashes é a forma mais eficiente de verificar igualdade de strings em Solidity
        // Uma vez que a linguagem NÃO possui o atributo ''.contains'' por natureza
        if (_id < 3 && keccak256(abi.encodePacked(status[_id])) != keccak256(abi.encodePacked("Undefined"))) {
            status[_id] = _status;
        }
    }
}
/*
onde você quer verificar se a string status[_id] não é igual a "Undefined", 
a melhor abordagem é simplesmente comparar as strings diretamente.

Você pode usar a função keccak256 para obter o hash das strings e compará-los. 
Isso é muito mais eficiente do que comparar byte a byte.

Considerações Importantes

    Custo de Gás: Operações com strings em Solidity podem ser caras. Sempre que possível, 
    tente evitar manipulações complexas de strings. Comparar hashes de strings é mais barato do que iterar sobre os bytes.

    Segurança: Ao lidar com strings fornecidas pelo usuário, esteja ciente de possíveis ataques de reentrância ou estouro 
    de buffer, embora para a lógica de contains isso seja menos relevante.

    Bibliotecas Externas: Para operações de string mais complexas (como substring, indexOf), 
    algumas bibliotecas externas como a OpenZeppelin Strings podem oferecer utilitários, mas elas ainda 
    precisam implementar a lógica manualmente por baixo dos panos, o que pode aumentar o custo de gás. 
    No entanto, para uma simples verificação de "não é igual a", a comparação de hashes é o caminho a seguir.
*/
