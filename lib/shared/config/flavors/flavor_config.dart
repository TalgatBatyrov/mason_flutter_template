import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_app/shared/config/di/injection.dart';

enum Flavor { development, production, staging }

class FlavorConfig {
  FlavorConfig._internal(this.name, this.apiBaseUrl);

  final String name;
  final String apiBaseUrl;
  static FlavorConfig? _instance;

  factory FlavorConfig(Flavor flavor) {
    _instance ??= _flavorConfigs[flavor];
    _initializeDependencies();
    return _instance!;
  }

  static final Map<Flavor, FlavorConfig> _flavorConfigs = {
    Flavor.development: FlavorConfig._internal(
      'Development',
      'https://jsonplaceholder.typicode.com',
    ),
    Flavor.production: FlavorConfig._internal(
      'Production',
      'https://api.production.example.com',
    ),
    Flavor.staging: FlavorConfig._internal(
      'Staging',
      'https://api.staging.example.com',
    ),
  };

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception(
          "FlavorConfig is not initialized. Call FlavorConfig(flavor) first.");
    }
    return _instance!;
  }

  static void _initializeDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies();
    await EasyLocalization.ensureInitialized();
  }
}
