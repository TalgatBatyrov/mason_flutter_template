import 'package:injectable/injectable.dart';
import 'package:test_app/feature/lola/data/repositories/lola_repository.dart';


@injectable
class LolaInteractor {
  final LolaRepository _repository;
  LolaInteractor(this._repository);

  Future<String> getLola() async {
    final response = await _repository.getLola();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
