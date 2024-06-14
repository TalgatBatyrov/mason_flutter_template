import 'package:dartz/dartz.dart';

abstract class LolaRepositoryImpl {
    Future<Either<Exception, String>> getLola();
}


 