

pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";

contract Base is GameObject{
    address[] public  addressesMilitaryUnits;

   function addMilitaryUnit(address addressMilitaryUnit) public checkOwnerAndAccept 
   {
       addressesMilitaryUnits.push(addressMilitaryUnit);
   }

   function deleteMilitaryUnit(address addressMilitaryUnit) public checkOwnerAndAccept 
   {
       address temp;
       for(uint i=0;i<addressesMilitaryUnits.length;i++)
       {
           if(addressMilitaryUnit==addressesMilitaryUnits[i]) 
           {
               temp=addressesMilitaryUnits[addressesMilitaryUnits.length-1];
               addressesMilitaryUnits[addressesMilitaryUnits.length-1]=addressesMilitaryUnits[i];
               addressesMilitaryUnits[i]=temp;
               addressesMilitaryUnits.pop();

           }
       }
   }

   


}
