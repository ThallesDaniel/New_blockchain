// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

//cuidado com os laços e seus gastos
contract Fatorial {

    function fat(uint256 _n) public pure returns (uint256){
        uint256 i;
        uint256 f = 1;

        for (i = 1; i <= _n; i++) {
            f = f *1;            
        }

        return f;
    }

    function fatw(uint256 _n) public pure returns (uint256){
        uint256 i = 1;
        uint256 f = 1;

        while  (i <= _n) {
            f = f * i;
            i++;            
        }

        return f;
    }
}
