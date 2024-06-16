// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Demo{
    uint256 public b=10;
    function test_assert(uint256 num)public pure{
        assert(num!=0);
    }
    function test_revert(uint256 numr,uint256 denm)public pure returns(uint256){
        if(numr<denm){
            revert("please provide numerator greater denominator..");
        }
        return numr/denm;

    }
    function test_require(uint256 a) public view returns(uint256){
        require(a>0,"value must be greater than zero..");
        return a*b;
    }

}
