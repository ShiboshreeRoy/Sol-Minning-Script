// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract TapTap{

    uint public count;

    function Get() public view  returns(uint){
        return count;
    }

    function Incriment() public {
        count +=1;
    }

    function Decriment() public{
        count -=1;
    }

}