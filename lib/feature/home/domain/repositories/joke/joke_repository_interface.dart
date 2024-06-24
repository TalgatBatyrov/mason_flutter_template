import 'package:dartz/dartz.dart';
import 'package:test_app/feature/home/data/model/joke/joke_model.dart';

abstract class JokeRepositoryInterface {
  Future<Either<Exception, JokeModel>> getJoke();
}