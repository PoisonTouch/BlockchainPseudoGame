
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";
import "Base.sol";

contract WarriorUnit is GameObject{
    address public addressOfBase;
    uint public  powerAttack;
    constructor(Base base) public {
        require(tvm.pubkey()!=0,101);
        tvm.accept();
        addressOfBase=base;
        Base(base).addMilitaryUnit(this);
    }

    function getPowerAttack(uint value) external  checkOwnerAndAccept  {
        powerAttack=value;
    }

    function deathAndDeleteFromBase(Base base) public checkOwnerAndAccept {
        death(msg.sender);
        base.deleteMilitaryUnit(this);
    }
}
