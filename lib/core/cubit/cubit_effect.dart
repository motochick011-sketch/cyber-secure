import '../navigation/screen_id.dart';

sealed class CubitEffect {
  const CubitEffect();
}

enum SnackbarType { success, error, warning, info }

class ShowSnackbarEffect extends CubitEffect {
  const ShowSnackbarEffect(this.message, {this.title, this.type = SnackbarType.info});

  final String message;
  final String? title;
  final SnackbarType type;
}

class CloseScreenEffect extends CubitEffect {
  const CloseScreenEffect();
}

class NavigateEffect extends CubitEffect {
  const NavigateEffect(this.target);

  final ScreenId target;
}
