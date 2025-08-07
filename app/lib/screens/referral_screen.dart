import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  String referralCode = '';
  List referrals = [];

  @override
  void initState() {
    super.initState();
    fetchReferralData();
  }

  Future<void> fetchReferralData() async {
    final codeResponse = await ApiService.getReferralCode();
    final listResponse = await ApiService.getReferrals();

    setState(() {
      referralCode = codeResponse['referralCode'] ?? '';
      referrals = listResponse ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Referral')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Your Referral Code: $referralCode',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Invited Users:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Expanded(
              child: referrals.isEmpty
                  ? const Center(child: Text('No referrals yet'))
                  : ListView.builder(
                      itemCount: referrals.length,
                      itemBuilder: (context, index) {
                        final user = referrals[index];
                        return ListTile(
                          title: Text(user['username']),
                          subtitle: Text('Coins: ${user['coins']}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}