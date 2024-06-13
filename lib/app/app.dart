import 'package:flutter/material.dart';
import 'package:test_app/shared/config/flavors/flavor_config.dart';
// import 'package:test_app/feature/home/presentation/pages/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final config = FlavorConfig.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: config.name,
      // home: const Home(),
    );
  }
}
