import 'package:dartz/dartz.dart';
import 'package:test_app/feature/home/data/model/home_model.dart';

abstract class HomeRepositoryInterface {
  Future<Either<Exception, HomeModel>> getHome();
}
