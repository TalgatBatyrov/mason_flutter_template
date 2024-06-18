import 'package:injectable/injectable.dart';
import 'package:test_app/feature/profile/data/repositories/profile_repository.dart';


@singleton
class ProfileInteractor {
  final ProfileRepository _repository;
  ProfileInteractor(this._repository);

  Future<String> getProfile() async {
    final response = await _repository.getProfile();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
