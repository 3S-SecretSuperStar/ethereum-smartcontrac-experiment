pragma solidity ^0.4.17;

contract Main {
  Sub public sub;
   event LogTest(string test);
   event LogAddress(address a);
  
  function Main() payable public {
      sub = new Sub();
  }


  function deposit() payable public {
   // sub = new Sub();
    sub.deposit.value(msg.value)();
  }

  function withdrawSend() public {
    sub.withdrawSend(msg.sender);
  }
  function withdrawTransfer() public {
    sub.withdrawTransfer( msg.sender );
  }
  function withdrawSelfdestruct() public {
    sub.withdrawSelfdestruct( msg.sender );
  }
  function getBalance() public returns (uint) {
    LogTest('test1234');

    return sub.getBalance();
  }
  function getOwnBalance() public view returns (uint){
      return this.balance;
  }
}


contract Sub {
  //uint public balance = 10;

  event LogTest(string test);
  event LogAddress(address a);

  function deposit() payable public returns (uint) {
    //balance = msg.value;
    return this.balance;
  }
  function withdrawSend( address a ) public {
     LogTest('withdraw via send');
     LogAddress(a);
     
     bool success = a.send(1 ether);
     if( success ){
         LogTest('success');
     } else {
         LogTest('fail');
     }
  }
  function withdrawTransfer( address a ) public {
    LogTest('withdraw via transfer');
    LogAddress(a);
    a.transfer(1 ether);
  }
  function withdrawSelfdestruct( address a ) public {
     LogTest('withdraw via selfdestruct');
     LogAddress(a);
     selfdestruct(a);
  }
  function getBalance() public view returns (uint) {
    return this.balance;
  }
}
