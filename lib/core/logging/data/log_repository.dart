import 'package:injectable/injectable.dart';

import '../../network/api_client.dart';
import '../../network/api_routes.dart';
import '../log_record.dart';

@lazySingleton
class LogRepository {
  LogRepository(this._api);

  final ApiClient _api;

  Future<void> sendLog(LogRecord record) async {
    await _api.post<void>(ApiRoutes.logs, body: record.toJson(), parse: (_) {});
  }
}
