import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/repositories/home_repository.dart';


@singleton
class HomeInteractor {
  final HomeRepository _repository;
  HomeInteractor(this._repository);

  Future<String> getHome() async {
    final response = await _repository.getHome();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
