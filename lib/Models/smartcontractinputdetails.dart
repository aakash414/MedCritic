import 'dart:convert';

import 'package:flutter/material.dart';
import "package:web3dart/web3dart.dart";
import 'package:http/http.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:frontendweb/Screens/login_page.dart';

class SmartContract extends StatelessWidget {
  const SmartContract({super.key});

  @override
  Widget build(BuildContext context) {
    final address = LoginPage().useraddress();

    return Scaffold(
      body: Center(
        child: FutureBuilder<UserData>(
          future: getUserData(address), 
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!;
              return Column(
                children: [
                  Text('Name: ${userData.name}'),
                  Text('Age: ${userData.age}'),
                  Text('Height: ${userData.height}'),
                  Text('Weight: ${userData.weight}'),
                  Text('Blood Group: ${userData.bloodGroup}'),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<UserData> getUserData(String address) async {
  final client = Web3Client(
      'https://rinkeby.infura.io/v3/c31b1d1069e141ada2775b3ac3eae2e5',
      Client());
  const contractabijson = '''
  {
    "abi": [
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "userAddress",
            "type": "address"
          },
          {
            "indexed": false,
            "internalType": "string",
            "name": "name",
            "type": "string"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "age",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "height",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "weight",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "string",
            "name": "bloodGroup",
            "type": "string"
          }
        ],
        "name": "UserAdded",
        "type": "event"
      },
      {
        "inputs": [
          {"internalType": "string", "name": "_name", "type": "string"},
          {"internalType": "uint256", "name": "_age", "type": "uint256"},
          {"internalType": "uint256", "name": "_height", "type": "uint256"},
          {"internalType": "uint256", "name": "_weight", "type": "uint256"},
          {"internalType": "string", "name": "_bloodGroup", "type": "string"}
        ],
        "name": "addUser",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "address", "name": "", "type": "address"}
        ],
        "name": "users",
        "outputs": [
          {"internalType": "string", "name": "name", "type": "string"},
          {"internalType": "uint256", "name": "age", "type": "uint256"},
          {"internalType": "uint256", "name": "height", "type": "uint256"},
          {"internalType": "uint256", "name": "weight", "type": "uint256"},
          {"internalType": "string", "name": "bloodGroup", "type": "string"}
        ],
        "stateMutability": "view",
        "type": "function"
      }
    ]
  }
  ''';
  final contract = DeployedContract(
    ContractAbi.fromJson(
        jsonDecode(contractabijson), '0xd9145CCE52D386f254917e481eB44e9943F39138'),
    EthereumAddress.fromHex('0xd9145CCE52D386f254917e481eB44e9943F39138'),
  );

  final name = await client.call(
    contract: contract,
    function: contract.function('getName'),
    params: [EthereumAddress.fromHex(address)],
  );

  final age = await client.call(
    contract: contract,
    function: contract.function('getAge'),
    params: [EthereumAddress.fromHex(address)],
  );

  final height = await client.call(
    contract: contract,
    function: contract.function('getHeight'),
    params: [EthereumAddress.fromHex(address)],
  );

  final weight = await client.call(
    contract: contract,
    function: contract.function('getWeight'),
    params: [EthereumAddress.fromHex(address)],
  );

  final bloodGroup = await client.call(
    contract: contract,
    function: contract.function('getBloodGroup'),
    params: [EthereumAddress.fromHex(address)],
  );

  return UserData(
    name: name[0] as String,
    age: age[0] as int,
    height: height[0] as int,
    weight: weight[0] as int,
    bloodGroup: bloodGroup[0] as String,
  );
}

class UserData {
  final String name;
  final int age;
  final int height;
  final int weight;
  final String bloodGroup;

  UserData({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.bloodGroup,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      bloodGroup: json['bloodGroup'],
    );
  }
}
