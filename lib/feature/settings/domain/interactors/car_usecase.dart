final class CarUseCase {
  CarUseCase(this.repository);

  final repository;

  void startEngine() {
    repository.startEngine();
  }
}
