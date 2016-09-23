contract HelloWorld {
  address public lastCaller;
  string public lastCallerName;

  function hello(string _name){
    lastCaller = msg.sender;
    lastCallerName = _name;
  }
}
