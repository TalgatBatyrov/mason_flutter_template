import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}} extends StatefulWidget {
  const {{feature_name.pascalCase()}}({super.key});
  @override
  State<{{feature_name.pascalCase()}}> createState() => _{{feature_name.pascalCase()}}State();
}

class _{{feature_name.pascalCase()}}State extends State<{{feature_name.pascalCase()}}> {
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