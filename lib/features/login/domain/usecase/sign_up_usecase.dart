import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/login/domain/entity/user_entity.dart';
import 'package:lookup/features/login/domain/repository/login_repository.dart';
import 'package:lookup/features/login/domain/usecase/credential_login_usecase.dart';

@lazySingleton
class SignUpUsecase extends UseCase<UserrEntity, CredentialLoginParam> {
  SignUpUsecase(this.repository);

  final LoginRepository repository;
  @override
  Future<Either<AppError, UserrEntity>> call(CredentialLoginParam param) {
    return repository.signUpWithCredential(
      email: param.email,
      password: param.password,
    );
  }
}
