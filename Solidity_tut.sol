Solidity_tut.sol

pragma solidity 0.8.3;

contract MyContract {
    string public value = "myStandardValue";
    
    bool public myBool = true;
    
    int public myInt=7;
    
    enum State {Waiting, Ready, Active}
    State public state;
    constructor () public {
        state = State.Waiting;
    }
    function active() public{
        state = State.Active;
    }
    
    function isActive() public view returns(bool){
     return state == State.Active;
    }
    function set(string memory _value) public {
        value = _value;
        
    }
}

pragma solidity ^0.8.3;

contract MyContract{
    
//Person[]public people;

    
    uint public peopleCount = 0;
   mapping(uint => Person) public people; 
   
   address owner;
   
   modifier onlyOwner(){
       
       require(msg.sender == owner);
       _;
   }
    
   struct Person {
       uint _id;
       string _firstName;
       string _lastName;
       uint _Age;
   } 
   
   constructor() public {
       owner = msg.sender;
   }
   
    function addPerson(
        string memory _firstName, 
        string memory _lastName, 
        uint _Age
        ) 
        
        public onlyOwner {
        peopleCount += 1;
        people[peopleCount] = Person (peopleCount, _firstName, _lastName, _Age);
        
        
    }
    function incrementCount() internal {
        peopleCount += 1;
    }
}

pragma solidity ^0.8.3;

contract MyContract{
    
//Person[]public people;

    
    uint public peopleCount = 0;
    mapping(uint => Person) public people; 
   

   uint256 openingTime = 1617995399;
   
   //only when this epoch unix timestamp has been passed you can execute the contract
   
   modifier onlyWhileOpne(){
       
       require(block.timestamp >= openingTime);
       _;
   }
    
   struct Person {
       uint _id;
       string _firstName;
       string _lastName;
       uint _Age;
   } 
   

   }
   
    function addPerson(
        string memory _firstName, 
        string memory _lastName, 
        uint _Age
        ) 
        
        public 
        onlyWhileOpen {
        peopleCount += 1;
        people[peopleCount] = Person (peopleCount, _firstName, _lastName, _Age);
        
        
    }
    function incrementCount() internal {
        peopleCount += 1;
    }
}

pragma solidity 0.8.3;

contract MyContract{
    
    mapping(address =>uint256)public balances;
    address payable wallet;
    
    event Purchase(
        address indexed _buyer,
        uint256 _amount
        );
    
    constructor (address payable _wallet)public{
        wallet = _wallet;
    }
   // function() external payable {buyToken() }
    
    function buyToken() public payable {
        //buyToken
        
        balances[msg.sender] +=1;
        
        //send ETH to Wallet
        wallet.transfer(msg.value);
        
        emit Purchase(msg.sender, 1);
    }
    
    
}

pragma solidity 0.5.1;

contract ERC20Token {
    string public name;
     mapping(address =>uint256)public balances;
     
     constructor(string memory _name)
     public{
         name = _name;
     }
     function mint() public{
         
         balances[tx.origin] ++;
     }
}



contract MyToken is ERC20Token{
    string public symbol;
    
    address[] public owners;
    uint256 ownerCount;
    
   constructor(
       string memory _name, 
       string memory _symbol
       ) 
       ERC20Token(_name) 
       public{
       symbol = _symbol;
       
   }

    function mint() public{
        super.mint();
        ownerCount ++;
        owners.push(msg.sender);
    }
    
}

pragma solidity 0.8.3;

library Math {
    function divide(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b>0);
        uint256 c = a/b;
        return c;
        
    }
    
}

//alternate import 

//import "./Math.sol";
//importantn lib is SafeMath!
// using SafeMath for uint256; then just use calucaltion: value= _value1.div(_value2);

contract MyContract {
    //DRY - Don't repeat yourself .. thus libs
    
    uint256 public value;
    
    function calculate(uint _value1, uint _value2) 
    public{ 
        value= Math.divide(_value1, _value2);
        
    }
}