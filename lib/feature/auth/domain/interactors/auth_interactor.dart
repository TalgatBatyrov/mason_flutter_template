import 'package:injectable/injectable.dart';
import 'package:test_app/feature/auth/data/repositories/auth_repository.dart';

@singleton
class AuthInteractor {
  final AuthRepository _repository;

  AuthInteractor(this._repository);

  Future<String> getAuth() async {
    final response = await _repository.getAuth();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
