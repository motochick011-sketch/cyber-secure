import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ConnectivitySource {
  ConnectivitySource();

  final Connectivity _connectivity = Connectivity();

  bool _isOnline(List<ConnectivityResult> results) => results.any((r) => r != ConnectivityResult.none);

  Stream<bool> get onChange => _connectivity.onConnectivityChanged.map(_isOnline);

  Future<bool> get isOnline async => _isOnline(await _connectivity.checkConnectivity());
}
