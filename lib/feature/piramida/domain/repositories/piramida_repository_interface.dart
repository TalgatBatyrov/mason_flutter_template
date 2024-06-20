import 'package:dartz/dartz.dart';
import 'package:test_app/feature/piramida/data/model/piramida_model.dart';

abstract class PiramidaRepositoryInterface {
    Future<Either<Exception, PiramidaModel>> getPiramida();
}