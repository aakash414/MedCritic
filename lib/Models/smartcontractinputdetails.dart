// Your Flutter code for interacting with the smart contract
// Ensure you've set up the connection to the Ethereum network and the contract ABI

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;


class ContractInteractionPage extends StatefulWidget {
  const ContractInteractionPage({Key? key}) : super(key: key);

  @override
  _ContractInteractionPageState createState() =>
      _ContractInteractionPageState();
}

class _ContractInteractionPageState extends State<ContractInteractionPage> {
  final String contractAddress = '0xd9145CCE52D386f254917e481eB44e9943F39138';
  final String privateKey =
      'c5f352daed3c0241890ef5abd72440e141d3adb0b1dac950a3a814d6e6315191';
  final contractAbiJson = jsonEncode({
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
        "type": "function",
      }
    ],
  });
  late Web3Client _client;
  late EthereumAddress _contractAddr;
  late Credentials _credentials;
  late DeployedContract _contract;

  @override
  void initState() {
    super.initState();
    // Initialize connection to Ethereum network and contract

    _client = Web3Client(
        'https://mainnet.infura.io/v3/c31b1d1069e141ada2775b3ac3eae2e5',
        http.Client());
    _contractAddr = EthereumAddress.fromHex(contractAddress);
    _credentials = EthPrivateKey.fromHex(privateKey);
    _contract = DeployedContract(
      ContractAbi.fromJson(contractAbiJson, ''), // Replace with contract ABI
      _contractAddr,
    );
  }

  Future<void> addUserToContract(
      String name, int age, int height, int weight, String bloodGroup) async {
    final contractFunction = _contract.function('addUser');
    final result = await _client.sendTransaction(
      _credentials,

      // ...

      web3dart.Transaction.callContract(
        contract: _contract,
        function: contractFunction,
        parameters: [
          name,
          BigInt.from(age),
          BigInt.from(height),
          BigInt.from(weight),
          bloodGroup,
        ],
      ),
      chainId: 1, // Ethereum mainnet
    );

    // Handle transaction result
    print('Transaction hash: ${result.transactionHash}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contract Interaction'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            addUserToContract(
              'John Doe',
              30,
              180,
              75,
              'O+',
            );
          },
          child: Text('Add User to Contract'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _client.dispose();
    super.dispose();
  }
}
