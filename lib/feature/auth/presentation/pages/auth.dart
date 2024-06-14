import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});
  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}