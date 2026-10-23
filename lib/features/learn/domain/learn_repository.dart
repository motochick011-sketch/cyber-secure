import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/learn/domain/models/lesson.dart';

abstract interface class LearnRepository {
  Future<Result<List<Lesson>>> getLessons({bool forceRefresh = false});
}
