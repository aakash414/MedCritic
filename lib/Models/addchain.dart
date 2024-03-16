// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:wallet_sdk_metamask/wallet_sdk_metamask.dart';

// _addChain() async {
//     if (connector.connected) {
//       try {
//         // Logger().d("add chain");

//         EthereumWalletConnectProvider provider =
//             EthereumWalletConnectProvider(connector);
//         launchUrlString(_uri, mode: LaunchMode.externalApplication);
//         var name = "Mumbai";
//         var chainId = ChainId.MATIC;
//         List<String> rpc = [
//           "https://matic-mumbai.chainstacklabs.com",
//           "https://rpc-mumbai.maticvigil.com",
//           "https://matic-testnet-archive-rpc.bwarelabs.com"
//         ];
//         var native = {"name": "MATIC", "symbol": "MATIC", "decimals": 18};
//         var explorers = ["https://mumbai.polygonscan.com"];

//         var response = await provider.addChain(
//             chainId: chainId,
//             chainName: name,
//             nativeCurrency: native,
//             rpc: rpc,
//             explorers: explorers);
//         // Logger().i(response);
//       } catch (exp) {
//         // Logger().e(exp);
//       }
//     }
//   }
