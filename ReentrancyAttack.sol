pragma solidity ^0.8.0 ;

import 'OpenZeppelin/openzeppelin-contracts/contracts/utils/ReentrancyGuard.sol';

//Abstract contract with Abstract function
interface ReceiverInterface {

//abstract function in Interface should always have external modifier
function onReceive() external;
}

//Victim of the attacker smart contract
//This contract holds some token on behalf of an address on blockchain
//the tokens are withdrawable

//inheritance
contract VictimContract is ReentrancyGuard {
  
  constructor() ReentrancyGuard() public {}
  
  uint256 public totalBalance;
  address public owner;
  
  constructor() public {
    totalBalance = _totalBalance;
    owner = msg.sender;
  }
  
  modifier enoughBalance {
    require (msg.value >= 10 ether , "Not enough balance");
    _;
  }
  
  //to defend reentrancy attack we use nonReentrant() modifier
  function withdrawal(uint256 _amount, address _to) enoughBalance nonReentrant() external returns(bool success) {
    owner.send(_to,1 ether);
  
  //accessing the function/state datastructures with dot operator
  ReceiverInterface.onReceive(msg.sender);
  
  totalBalance -= _amount;
  return success;
  }
  }
  
 contract AttackerContract {
  uint8 internal count;
  function start() external {
  onReceive();
  
  function onReceive() external {
  for (count = 0 ; count <7 ; count ++ ){
  VictimContract.withdrawal(1 ether , #######);
  }
  }
 }
 
