import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ColorTradingScreen extends StatefulWidget {
  const ColorTradingScreen({Key? key}) : super(key: key);

  @override
  State<ColorTradingScreen> createState() => _ColorTradingScreenState();
}

class _ColorTradingScreenState extends State<ColorTradingScreen> {
  String selectedColor = '';
  final TextEditingController amountController = TextEditingController();
  String latestResult = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchLatestResult();
  }

  Future<void> fetchLatestResult() async {
    final response = await ApiService.getLatestResult();
    setState(() {
      latestResult = response['result'] ?? 'No result yet';
    });
  }

  Future<void> placeBet() async {
    if (selectedColor.isEmpty || amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select color and amount')),
      );
      return;
    }

    final response = await ApiService.placeBet(
      selectedColor,
      double.parse(amountController.text),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response['message'])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Trading')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Latest Result: $latestResult',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _colorButton('Red', Colors.red),
                _colorButton('Green', Colors.green),
                _colorButton('Blue', Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Bet Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: placeBet,
              child: const Text('Place Bet'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorButton(String colorName, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () {
        setState(() {
          selectedColor = colorName.toLowerCase();
        });
      },
      child: Text(colorName),
    );
  }
}