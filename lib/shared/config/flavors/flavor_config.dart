import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/shared/config/di/injection.dart';

class FlavorConfig {
  final String name;
  final String apiBaseUrl;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required String name,
    required String apiBaseUrl,
  }) {
    _instance ??= FlavorConfig._internal(name, apiBaseUrl);
    _initializeDependencies();

    return _instance!;
  }

  FlavorConfig._internal(this.name, this.apiBaseUrl);

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception(
          "FlavorConfig is not initialized. Call FlavorConfig() first.");
    }
    return _instance!;
  }

  static void _initializeDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   name: AppFlavors.firebaseName,
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    configureDependencies();
    await EasyLocalization.ensureInitialized();
  }
}
