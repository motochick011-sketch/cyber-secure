import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cubit/view_state.dart';

part 'general_state.freezed.dart';

@freezed
abstract class GeneralData with _$GeneralData {
  const factory GeneralData({@Default(true) bool online}) = _GeneralData;
}

typedef GeneralState = ViewState<GeneralData>;
