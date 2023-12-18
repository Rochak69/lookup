import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/login/domain/entity/user_entity.dart';
import 'package:lookup/features/login/domain/repository/login_repository.dart';

class CredentialLoginParam {
  CredentialLoginParam({required this.email, required this.password});

  final String email;
  final String password;
}

@lazySingleton
class CredentialLoginUsecase
    extends UseCase<UserrEntity, CredentialLoginParam> {
  CredentialLoginUsecase(this.repository);

  final LoginRepository repository;
  @override
  Future<Either<AppError, UserrEntity>> call(CredentialLoginParam param) {
    return repository.credentialLogin(
      email: param.email,
      password: param.password,
    );
  }
}
