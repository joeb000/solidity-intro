pragma solidity ^0.4.0;

contract Crowdfund {
  event DonationReceived(address _donor, uint _amount);
  event FundsSpent(address _recip, uint _amount);

  address public admin;
  uint public target;
  bool public returnFunds;

  mapping (address => uint) public donations;

  modifier onlyAdmin() {
    if (msg.sender == admin)
    _;
  }

  //Contstructor - called only once during contract creation
  function Crowdfund(uint _fundTarget) {
    admin = msg.sender;
    target = _fundTarget;
  }

  function donate() payable {
    if (this.balance + msg.value > target) {
      //Do not accept donations once target is reached, use throw to reject transactions that put the balance over the target
      throw;
    }
    //otherwise accept their donation and track their donation total
    donations[msg.sender]+=msg.value;
    DonationReceived(msg.sender,msg.value);
  }

  function spend(address _recipient, uint _amount) onlyAdmin() {
    if (_recipient.send(_amount)){
      FundsSpent(_recipient, _amount);
    }
  }

  function returnFundsToDonors() onlyAdmin() {
    returnFunds = true;
  }

  function withdrawFunds() {
    if (returnFunds){
      msg.sender.send(donations[msg.sender]);
    }
  }
}
