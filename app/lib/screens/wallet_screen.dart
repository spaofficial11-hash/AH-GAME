import 'package:flutter/material.dart';
import '../services/api_service.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double balance = 0;

  @override
  void initState() {
    super.initState();
    fetchWalletBalance();
  }

  Future<void> fetchWalletBalance() async {
    final response = await ApiService.getWallet();
    setState(() {
      balance = response['balance']?.toDouble() ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Balance: ₹$balance',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: fetchWalletBalance,
              child: const Text('Refresh Balance'),
            ),
          ],
        ),
      ),
    );
  }
}