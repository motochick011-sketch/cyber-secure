import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../logging/logger.dart';

@lazySingleton
class PlatformService {
  PlatformService(this._logger);

  final Logger _logger;

  Future<bool> openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e, s) {
      _logger.error(e, s);
      return false;
    }
  }

  Future<void> shareText(String text, {String? subject}) => SharePlus.instance.share(ShareParams(text: text, subject: subject));

  Future<void> copyToClipboard(String text) => Clipboard.setData(ClipboardData(text: text));

  Future<bool> launchEmail(String to, {String? subject, String? body}) {
    final params = <String, String>{};
    if (subject != null) params['subject'] = subject;
    if (body != null) params['body'] = body;
    final query = params.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value)}').join('&');
    final uri = Uri(scheme: 'mailto', path: to, query: query.isEmpty ? null : query);
    return openUrl(uri.toString());
  }

  static String enumToString(dynamic enumValue) {
    if (enumValue != null) return enumValue.toString().split('.').last;
    return '';
  }

  static T enumFromString<T>(String? key, List<T> values) {
    if (key != null && values.any((element) => enumToString(element) == key)) return values.firstWhere((element) => key == enumToString(element));
    return values.first;
  }
}
