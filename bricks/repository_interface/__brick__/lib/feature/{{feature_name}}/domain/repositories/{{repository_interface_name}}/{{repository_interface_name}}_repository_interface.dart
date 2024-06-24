
import 'package:dartz/dartz.dart';
 abstract class {{repository_interface_name.pascalCase()}}RepositoryInterface {
    Future<Either<Exception, String>> get{{repository_interface_name.pascalCase()}}();
 }
