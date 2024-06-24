import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/model/joke/joke_model.dart';
import 'package:test_app/feature/home/domain/repositories/joke/joke_repository_interface.dart';

@singleton
class JokeInteractor {
  JokeInteractor({
    required JokeRepositoryInterface repository,
  }) : _repository = repository;

  final JokeRepositoryInterface _repository;

  Future<Either<Exception, JokeModel>> getJoke() async {
    return await _repository.getJoke();
  }
}
