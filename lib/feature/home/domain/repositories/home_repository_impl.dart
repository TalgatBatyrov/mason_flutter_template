import 'package:dartz/dartz.dart';

abstract class HomeRepositoryImpl {
    Future<Either<Exception, String>> getHome();
}


 