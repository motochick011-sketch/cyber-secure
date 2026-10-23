import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import '../logging/logger.dart';

@lazySingleton
class BiometricService {
  BiometricService(this._logger);

  final LocalAuthentication _auth = LocalAuthentication();
  final Logger _logger;

  Future<bool> get isAvailable async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } catch (e, s) {
      _logger.error(e, s);
      return false;
    }
  }

  Future<bool> authenticate({String reason = 'Please authenticate'}) async {
    try {
      return await _auth.authenticate(localizedReason: reason, biometricOnly: false, persistAcrossBackgrounding: true);
    } catch (e, s) {
      _logger.error(e, s);
      return false;
    }
  }
}
