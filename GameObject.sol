
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObjectInterface.sol";

// This is class that describes you smart contract.
contract GameObject is GOInterface {
    uint public powerProtection;
    uint public hp=5;

    function getPowerProtection(uint power) public {
        powerProtection=power;
    }

    function acceptTheAttack(uint damage) virtual public override checkOwnerAndAccept {
        if(checkForDeath(damage)==true) {
            death(msg.sender);
        }
        else {
            hp=hp-(damage-powerProtection);
        }
    }

    function checkForDeath(uint damage) internal view returns(bool) {
        if((hp<=0)||((damage-powerProtection)>=hp)) return true;
        else return false;
    }

    function death(address addressOfKiller) public {
        addressOfKiller.transfer(1, false, 160);
    }

    modifier checkOwnerAndAccept {
        // Check that inbound message was signed with owner's public key.
        // Runtime function that obtains sender's public key.
        require(msg.pubkey() == tvm.pubkey(), 100);

		// Runtime function that allows contract to process inbound messages spending
		// its own resources (it's necessary if contract should process all inbound messages,
		// not only those that carry value with them).
		tvm.accept();
		_;
	}
    
}
