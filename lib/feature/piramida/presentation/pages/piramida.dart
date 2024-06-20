import 'package:flutter/material.dart';

class PiramidaPage extends StatefulWidget {
  const PiramidaPage({super.key});
  @override
  State<PiramidaPage> createState() => _PiramidaPageState();
}

class _PiramidaPageState extends State<PiramidaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piramida'),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}