import 'package:cybersecure/design_system/theme/brand.dart';

import 'environment.dart';

class AppConfig {
  const AppConfig({
    required this.environment,
    required this.brand,
    required this.appName,
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.remoteLoggingEnabled,
    this.defaultHeaders = const {},
  });


  final AppEnvironment environment;

  final Brand brand;

  final String appName;

  final String baseUrl;

  final Duration connectTimeout;
  final Duration receiveTimeout;

  final bool remoteLoggingEnabled;

  final Map<String, String> defaultHeaders;

  factory AppConfig.forEnvironment(AppEnvironment env) {
    return switch (env) {
      AppEnvironment.prod => const AppConfig(
        environment: AppEnvironment.prod,
        brand: Brand.prod,
        appName: 'CyberSecure',
        baseUrl: 'https://api.cybersecure.com',
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 20),
        remoteLoggingEnabled: true,
      ),
    };
  }
}
