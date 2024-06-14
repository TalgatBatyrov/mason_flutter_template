import 'package:dartz/dartz.dart';

abstract class AuthRepositoryImpl {
    Future<Either<Exception, String>> getAuth();
}


 