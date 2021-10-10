pragma solidity ^0.5.0;

contract Messenger {

string defaultMessage;
mapping (address => string) public accounts;

constructor() public{
    defaultMessage = 'is the message';
}

function getMessage() public view returns(string memory){
    string memory message = bytes(accounts[msg.sender]).length > 0 ? accounts[msg.sender] : defaultMessage;
    return concat("Greetings " , message);
}


function setMessage(string memory message) public returns(bool success){
    require(bytes(defaultMessage).length > 0);
    accounts[msg.sender] = message;
    return true;
}

 function concat(string memory _base, string memory _value) internal pure returns (string memory) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);

        uint i;
        uint j;

        for(i=0; i<_baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }

        for(i=0; i<_valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i];
        }

        return string(_newValue);
    }
}
