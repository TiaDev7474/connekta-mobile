import 'package:connekta/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure,Output>> call(Input input);
}

abstract class StreamUseCase<Output, Input> {
  Stream<Output> call(Input input);
}