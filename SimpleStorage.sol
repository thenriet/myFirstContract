// SPDX-License-Identifier:MIT
pragma solidity ^0.8.8; // 0.8.8 is prefered, but any newer version will work

contract SimpleStorage {
    // bool hasFavoriteNumber = true;
    uint256 public favoriteNumber;
    // string favoriteNumberInText = "Five";
    // int256 favoriteInt = -5;
    // address myAddress = 0x4908EA1ff49d520D14280AAECEf7F7BF6f78D919; // metamask address here
    // bytes32 favoriteBytes = "cat"; // bytes32 is the maximum possible byte you can use
    // People public person = People({favoriteNumber: 2, name: "Patrick"}); //-> Kewl but I have to create new objects, DRY not respected
    // People public person1 = People({favoriteNumber: 5, name: "Isa"});

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint[] public favoriteNumbersList;

    // creation of people array
    // here it is a dynamic array, because a mix isnt given in the brackets
    // -> People[3] means you specify that only 3 people can populate this array
    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // keywords 'view' and 'pure' are the only words making functions not use any gas
    // 'view' means we just gonna read state of something of this contract
    // plus it disallows any modification of state, you cant update the blockchain at all with view functions
    // 'pure' functions also disallows any modification of state + disallow reading from the blockchain
    // reading from the blockchain means NO GAS
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    // calldata, memory and storage keywords
    // calldata -> variable is deleted after the function call, and cant be affected a new value
    // memory -> variable is deleted after the function call, but CAN be affected a new value
    // storage -> permanent variable. A function variable cant accept a storage type of variable
    // uint256 -> automatically knows that it will be a memory variable, so you dont need to precise it
    function addPerson(string calldata _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
    }

}
