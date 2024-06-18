import 'package:injectable/injectable.dart';
import 'package:test_app/feature/other/data/repositories/other_repository.dart';


@singleton
class OtherInteractor {
  final OtherRepository _repository;
  OtherInteractor(this._repository);

  Future<String> getOther() async {
    final response = await _repository.getOther();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
