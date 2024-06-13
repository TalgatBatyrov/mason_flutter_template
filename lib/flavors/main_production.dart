import 'package:flutter/material.dart';
import 'package:test_app/app/app.dart';
import 'package:test_app/config/flavor_config.dart';

void main() {
  FlavorConfig(
    name: 'Production',
    apiBaseUrl: 'https://api.prod.example.com',
  );

  runApp(const App());
}
