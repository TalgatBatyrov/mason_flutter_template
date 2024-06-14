import 'package:flutter/material.dart';

class Lola extends StatefulWidget {
  const Lola({super.key});
  @override
  State<Lola> createState() => _LolaState();
}

class _LolaState extends State<Lola> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lola'),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}