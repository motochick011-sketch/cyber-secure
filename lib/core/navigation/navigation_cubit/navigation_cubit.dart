import 'package:cybersecure/core/navigation/app_router.dart';
import 'package:cybersecure/core/navigation/screen_id.dart';
import 'package:cybersecure/core/navigation/sub_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationCubit {
  NavigationCubit(this._router);

  final AppRouter _router;

  GoRouter get _r => _router.config;

  void goTo(ScreenId screen) {
    switch (screen.kind) {
      case ScreenKind.overlay:
        _r.push(screen.path);
      case ScreenKind.flow:
      case ScreenKind.tab:
        _r.go(screen.path);
    }
  }

  Future<void> push(SubScreen screen) async {
    _r.push(kSubScreenPath, extra: screen.builder);
  }

  void pop() => _r.pop();
}
