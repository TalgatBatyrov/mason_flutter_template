import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Page extends StatefulWidget {
  const {{feature_name.pascalCase()}}Page({super.key});
  @override
  State<{{feature_name.pascalCase()}}Page> createState() => _{{feature_name.pascalCase()}}PageState();
}

class _{{feature_name.pascalCase()}}PageState extends State<{{feature_name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.pascalCase()}}'),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}