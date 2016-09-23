contract GuestList {
  mapping (address => string) public guests;
  address[] public guestList;
  uint public guestNumber;

  function GuestList(){
      guestList.push(msg.sender);
      guests[msg.sender]="Admin";
  }

  function signList(string _name) {
      if (bytes(guests[msg.sender]).length==0){
          //guest has not yet signed
          guestList.push(msg.sender);
          guestNumber++;
      }
      guests[msg.sender]=_name;

  }

  function printLastGuest() returns (string) {
      return guests[guestList[guestNumber]];
  }

}
