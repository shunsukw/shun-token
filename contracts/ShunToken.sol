pragma solidity ^0.4.24;

// import zeppelin solidity file
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

//make our own contract using pre-verified zeppelin-code
contract ShunToken is StandardToken {
  //define names
  string public name = "ShunToken";
  string public symbol = "ST";
  uint public decimals = 18;
  //set variables
  address public owner;
  mapping(address => string) public thanksMessage;
  uint public maxSupply;
  uint public totalSupply;
  //contractor will be executed when the contract is called
  constructor(uint _initialSupply, uint _maxSupply) public {
    //initalize variables
    owner = msg.sender;
    totalSupply = _initialSupply;
    maxSupply = _maxSupply;
    balances[msg.sender] = _initialSupply;
  }
  //creat functions we need for our token
  //additional issue function
  function addTotalSupply(uint256 _value) public {
    require(owner == msg.sender);
    require(maxSupply >= (totalSupply + _value));

    totalSupply += _value;
    balances[msg.sender] += _value;
  }
  //send message with 100coin function
  function thanks(address _to, string _message) public {
    transfer(_to, 100e18);
    thanksMessage[_to] = _message;
  }
  //review thanks message function
  function thanksMessage(address _address) public view returns (string) {
    return thanksMessage[_address];
  }
}
