import 'package:flutter/material.dart';
import 'color_trading_screen.dart';
import 'spin_wheel_screen.dart';
import 'wallet_screen.dart';
import 'referral_screen.dart';
import 'withdraw_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AH GAME'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _buildMenuButton(context, 'Color Trading', const ColorTradingScreen()),
          _buildMenuButton(context, 'Spin Wheel', const SpinWheelScreen()),
          _buildMenuButton(context, 'Wallet', const WalletScreen()),
          _buildMenuButton(context, 'Referral', const ReferralScreen()),
          _buildMenuButton(context, 'Withdraw', const WithdrawScreen()),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}