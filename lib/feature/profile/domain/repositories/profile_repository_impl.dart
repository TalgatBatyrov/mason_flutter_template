import 'package:dartz/dartz.dart';

abstract class ProfileRepositoryImpl {
    Future<Either<Exception, String>> getProfile();
}


 