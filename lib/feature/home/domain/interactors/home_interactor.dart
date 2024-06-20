import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/model/home_model.dart';
import 'package:test_app/feature/home/domain/repositories/home_repository_interface.dart';

@singleton
class HomeInteractor {
  HomeInteractor({
    required HomeRepositoryInterface repository,
  }) : _repository = repository;

  final HomeRepositoryInterface _repository;

  Future<Either<Exception, HomeModel>> getHome() async {
    return await _repository.getHome();
  }
}
