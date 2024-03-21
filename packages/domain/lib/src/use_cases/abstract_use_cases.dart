abstract class UseCase<Input, Output> {
  const UseCase();

  Output execute(Input payload);
}

abstract class FutureUseCase<Input, Output> {
  const FutureUseCase();

  Future<Output> execute(Input payload);
}

abstract class StreamUseCase<Input, Output> {
  const StreamUseCase();

  Stream<Output> execute(Input payload);
}
