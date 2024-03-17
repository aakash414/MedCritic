// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserRegistry {
    struct UserData {
        string name;
        uint256 age;
        uint256 height;
        uint256 weight;
        string bloodGroup;
    }

    mapping(address => UserData) public users;

    event UserAdded(
        address indexed userAddress,
        string name,
        uint256 age,
        uint256 height,
        uint256 weight,
        string bloodGroup
    );

    function addUser(
        string memory _name,
        uint256 _age,
        uint256 _height,
        uint256 _weight,
        string memory _bloodGroup
    ) external {
        require(bytes(_name).length > 0, "Name must not be empty");
        require(_age > 0, "Age must be greater than 0");
        require(_height > 0, "Height must be greater than 0");
        require(_weight > 0, "Weight must be greater than 0");
        require(bytes(_bloodGroup).length > 0, "Blood group must not be empty");

        users[msg.sender] = UserData(
            _name,
            _age,
            _height,
            _weight,
            _bloodGroup
        );
        emit UserAdded(msg.sender, _name, _age, _height, _weight, _bloodGroup);
    }

    function getUser(
        address userAddress
    )
        external
        view
        returns (string memory, uint256, uint256, uint256, string memory)
    {
        UserData memory user = users[userAddress];
        require(bytes(user.name).length > 0, "User not found");
        return (user.name, user.age, user.height, user.weight, user.bloodGroup);
    }
}
