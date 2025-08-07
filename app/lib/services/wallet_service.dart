import 'api_service.dart';

class WalletService {
  // Get user wallet balance
  static Future<double> getBalance() async {
    final response = await ApiService.getWallet();
    return response['balance']?.toDouble() ?? 0.0;
  }

  // Withdraw coins
  static Future<String> withdraw(double amount) async {
    final response = await ApiService.withdrawCoins(amount);
    return response['message'] ?? 'Something went wrong';
  }
}