import 'dart:math';
import 'package:flutter/material.dart';

class SpinWheelScreen extends StatefulWidget {
  const SpinWheelScreen({Key? key}) : super(key: key);

  @override
  State<SpinWheelScreen> createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double angle = 0;
  int prize = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  void spinWheel() {
    final random = Random();
    double newAngle = (random.nextInt(6) * (pi / 3)) + (2 * pi * 5); // 6 segments
    _animation = Tween<double>(begin: angle, end: angle + newAngle)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          angle += newAngle;
          prize = (random.nextInt(6) + 1) * 10; // Prize between 10-60 coins
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You won $prize coins!')),
          );
        }
      });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spin Wheel')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Transform.rotate(
              angle: _animation?.value ?? 0,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const SweepGradient(colors: [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.orange,
                    Colors.purple,
                    Colors.yellow,
                  ]),
                  border: Border.all(color: Colors.black, width: 4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: spinWheel,
            child: const Text('Spin Now'),
          ),
        ],
      ),
    );
  }
}