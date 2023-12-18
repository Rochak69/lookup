import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/login/domain/entity/user_entity.dart';
import 'package:lookup/features/login/domain/repository/login_repository.dart';

@lazySingleton
class GoogleLoginUsecase extends UseCase<UserrEntity, NoParam> {
  GoogleLoginUsecase(this.repository);

  final LoginRepository repository;
  @override
  Future<Either<AppError, UserrEntity>> call(NoParam param) {
    return repository.googleLogin();
  }
}
