import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<AppError, Type>> call(Param param);
}

abstract class SynchronousUseCase<Type, Param> {
  Either<AppError, Type> call(Param param);
}

class NoParam {}

abstract class AppError implements Exception {
  AppError({
    this.errorMessage = 'An error has occured',
  });
  String errorMessage;
}

class InternalAppError extends AppError {
  InternalAppError({required super.errorMessage});
}

class NoInternetError extends AppError {
  NoInternetError({required super.errorMessage});
}

class GraphErrorMessage extends AppError {
  GraphErrorMessage({required super.errorMessage});
}
