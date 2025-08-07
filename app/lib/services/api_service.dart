import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "https://your-backend-url.com/api"; // Change to your backend URL

  // User Login
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  // User Registration
  static Future<Map<String, dynamic>> register(String username, String password, String referral) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'referralCode': referral.isNotEmpty ? referral : null,
      }),
    );
    return jsonDecode(response.body);
  }

  // Get Wallet Balance
  static Future<Map<String, dynamic>> getWallet() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/wallet'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body);
  }

  // Place Bet in Color Trading
  static Future<Map<String, dynamic>> placeBet(String color, double amount) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
      Uri.parse('$baseUrl/game/bet'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({'color': color, 'amount': amount}),
    );
    return jsonDecode(response.body);
  }

  // Get Latest Color Trading Result
  static Future<Map<String, dynamic>> getLatestResult() async {
    final response = await http.get(Uri.parse('$baseUrl/game/latest'));
    return jsonDecode(response.body);
  }

  // Withdraw Coins
  static Future<Map<String, dynamic>> withdrawCoins(double amount) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
      Uri.parse('$baseUrl/wallet/withdraw'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({'amount': amount}),
    );
    return jsonDecode(response.body);
  }

  // Get Referral Code
  static Future<Map<String, dynamic>> getReferralCode() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/referral/code'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body);
  }

  // Get Referrals List
  static Future<List<dynamic>> getReferrals() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/referral'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body);
  }
}