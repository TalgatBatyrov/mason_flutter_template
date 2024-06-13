class FlavorConfig {
  final String name;
  final String apiBaseUrl;

  static late FlavorConfig _instance;

  factory FlavorConfig({required String name, required String apiBaseUrl}) {
    _instance = FlavorConfig._internal(name, apiBaseUrl);
    return _instance;
  }

  FlavorConfig._internal(this.name, this.apiBaseUrl);

  static FlavorConfig get instance => _instance;
}
