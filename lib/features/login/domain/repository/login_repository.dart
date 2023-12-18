import 'package:dartz/dartz.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/login/domain/entity/user_entity.dart';

abstract class LoginRepository {
  Future<Either<AppError, UserrEntity>> googleLogin();
  Future<Either<AppError, UserrEntity>> credentialLogin({
    required String email,
    required String password,
  });
  Future<Either<AppError, UserrEntity>> signUpWithCredential({
    required String email,
    required String password,
  });
}
