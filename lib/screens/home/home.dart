import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() =>
      _MyWidgetState();
}

class _MyWidgetState
    extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Characters',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(
          16,
        ),
        child: const Text('Home'),
      ),
    );
  }
}
