import 'package:injectable/injectable.dart';
import 'package:test_app/feature/lola/data/repositories/lola_repository.dart';


@injectable
class KaifInteractor {
  final LolaRepository _repository;
  KaifInteractor(this._repository);

  Future<String> getKaif() async {
    final response = await _repository.getLola();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
