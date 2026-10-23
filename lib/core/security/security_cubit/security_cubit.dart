import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';

import '../../cubit/base_cubit.dart';
import '../../storage/secure_storage.dart';
import '../biometric_service.dart';
import 'security_state.dart';

@lazySingleton
class SecurityCubit extends BaseCubit<SecurityData> {
  SecurityCubit(this._secure, this._biometric) : super(const SecurityData());

  final SecureStorage _secure;
  final BiometricService _biometric;

  static const String _salt = 'pin_salt';

  bool get isUnlocked => state.data.unlocked;

  Future<void> load() async {
    final hasPin = (await _secure.pinHash) != null;
    final bioAvailable = await _biometric.isAvailable;
    setLoaded(state.data.copyWith(pinEnabled: hasPin, biometricEnabled: bioAvailable));
  }

  String _hash(String pin) => sha256.convert(utf8.encode('$_salt:$pin')).toString();

  Future<void> enablePin(String pin) async {
    await _secure.setPinHash(_hash(pin));
    setLoaded(state.data.copyWith(pinEnabled: true, unlocked: true));
  }

  Future<void> disablePin() async {
    await _secure.clearPin();
    setLoaded(state.data.copyWith(pinEnabled: false));
  }

  Future<bool> verifyPin(String pin) async {
    final stored = await _secure.pinHash;
    final ok = stored != null && stored == _hash(pin);
    if (ok) setLoaded(state.data.copyWith(unlocked: true));
    return ok;
  }

  Future<bool> verify({String reason = 'Please authenticate'}) async {
    if (isUnlocked) return true;
    if (state.data.biometricEnabled) {
      final ok = await _biometric.authenticate(reason: reason);
      if (ok) setLoaded(state.data.copyWith(unlocked: true));
      return ok;
    }

    return false;
  }

  void lock() => setLoaded(state.data.copyWith(unlocked: false));
}
