import 'package:flutter/material.dart';
import 'package:test_app/app/app.dart';
import 'package:test_app/shared/config/flavors/flavor_config.dart';

void main() {
  FlavorConfig(
    name: 'Main',
    apiBaseUrl: 'https://jsonplaceholder.typicode.com',
  );

  runApp(const App());
}
