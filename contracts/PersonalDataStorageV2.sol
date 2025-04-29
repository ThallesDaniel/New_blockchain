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
    
 }