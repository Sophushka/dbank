// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "./Token.sol";

contract dBank {

  //assign Token contract to variable
  Token private token;
  //add mappings
  mapping (address => uint) private _etherBalance;
  mapping (address => uint) private _depositStart;
  mapping (address => bool) private _isDeposited;


  //add events
  event Deposit (address indexed user, uint etherAmount, uint timeStart);

  //pass as constructor argument deployed Token contract
  //assign token deployed contract to variable
  constructor(Token _token) public {
    token = _token;
  }



  /**
 * @dev Returns isDeposited
 */
  function isDeposited(address user) public view returns (bool) {
    return _isDeposited[user];
  }

  /**
   * @dev Returns depositStart
   */
  function depositStart(address user) public view returns (uint) {
    return _depositStart[user];
  }



  /**
   * @dev Returns the Balance of the user
   */
  function etherBalanceOf(address user) public view returns (uint) {
    return _etherBalance[user];
  }



  function deposit() payable public {
    require(_isDeposited[msg.sender] == false, 'Error, deposit already active');
    require(msg.value>= 10**16, 'Error, deposit must be >== 0.01 ETH');
    //check if msg.sender didn't already deposited funds
    //check if msg.value is >= than 0.01 ETH
    _etherBalance[msg.sender] = _etherBalance[msg.sender] + msg.value ;
    _depositStart[msg.sender] = _depositStart[msg.sender] + block.timestamp ;
    _isDeposited[msg.sender] = true;
    emit Deposit(msg.sender, msg.value, block.timestamp);

    //increase msg.sender ether deposit balance
    //start msg.sender hodling time

    //set msg.sender deposit status to true
    //emit Deposit event
  }

  function withdraw() public {
    //check if msg.sender deposit status is true
    //assign msg.sender ether deposit balance to variable for event

    //check user's hodl time

    //calc interest per second
    //calc accrued interest

    //send eth to user
    //send interest in tokens to user

    //reset depositer data

    //emit event
  }

  function borrow() payable public {
    //check if collateral is >= than 0.01 ETH
    //check if user doesn't have active loan

    //add msg.value to ether collateral

    //calc tokens amount to mint, 50% of msg.value

    //mint&send tokens to user

    //activate borrower's loan status

    //emit event
  }

  function payOff() public {
    //check if loan is active
    //transfer tokens from user back to the contract

    //calc fee

    //send user's collateral minus fee

    //reset borrower's data

    //emit event
  }
}