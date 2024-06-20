import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/piramida/data/model/piramida_model.dart';
import 'package:test_app/feature/piramida/domain/repositories/piramida_repository_interface.dart';

@singleton
class PiramidaInteractor {
  PiramidaInteractor({
    required PiramidaRepositoryInterface repository,
  }) : _repository = repository;

  final PiramidaRepositoryInterface _repository;

  Future<Either<Exception, PiramidaModel>> getPiramida() async {
    return await _repository.getPiramida();
  }
}

