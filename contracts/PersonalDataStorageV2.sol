//SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract PersonDataStoreV2 {
    string public name;
    uint private age;
    bool internal brazilian;

    constructor(){
        name = "jeremias";
        age = 10;
        brazilian = true;
    }

    //Sempre que o paraetro for string, atribua o memory
    //usar funções custa gas
    function setName(string memory _name) public {
       name = _name;
    }

    function setAge(uint _age) public {
        age = _age;
    }

    //como o age é private, para private, se quiser consultar, é necessário criar uma função consulta
    function getAge() public view returns (uint) {
        return age;
    }

    function setNacionalityBr(bool _braz) public {
        brazilian = _braz;
    }
    function getNacionalityBr() public view returns (bool) {
        return brazilian;
    }
    

    //Função só pode ser visualidada dentro do contrato e de quem herda dele
    //uma função pura só faz uma única operação, ela não altera o estado da blockchain
    function addValues(uint _value1, uint _value2) internal pure returns(uint){
        return _value1 + _value2;
    } 

    //Essa função só pode ser acessada por um operador externo ao contrato
    function incrementAge() external {
        age = addValues(age, 1);
    }
  

 }