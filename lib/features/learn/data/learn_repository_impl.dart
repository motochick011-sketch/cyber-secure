import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/learn/data/learn_remote_source.dart';
import 'package:cybersecure/features/learn/data/mappers/learn_mapper.dart';
import 'package:cybersecure/features/learn/domain/learn_repository.dart';
import 'package:cybersecure/features/learn/domain/models/lesson.dart';

class LearnRepositoryImpl implements LearnRepository {
  LearnRepositoryImpl(this._remote);

  final LearnRemoteSource _remote;

  @override
  Future<Result<List<Lesson>>> getLessons({bool forceRefresh = false}) async {
    final res = await _remote.getLessons(forceRefresh: forceRefresh);
    return res.map((dtos) => dtos.map((dto) => dto.toDomain()).toList());
  }
}
