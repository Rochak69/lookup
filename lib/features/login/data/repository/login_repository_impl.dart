import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/login/data/model/user_model.dart';
import 'package:lookup/features/login/data/source/login_remote_source.dart';
import 'package:lookup/features/login/domain/entity/user_entity.dart';
import 'package:lookup/features/login/domain/repository/login_repository.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this.remoteSource);

  final LoginRemoteSource remoteSource;

  @override
  Future<Either<AppError, UserModel>> googleLogin() async {
    try {
      final response = await remoteSource.googleLogin();
      return right(response);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ApiError(errorMessage: e.code));
      } else {
        return left(ApiError(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<AppError, UserrEntity>> credentialLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteSource.signInWithPassword(
        email: email,
        password: password,
      );
      return right(response);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ApiError(errorMessage: e.code));
      } else {
        return left(ApiError(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<AppError, UserrEntity>> signUpWithCredential({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteSource.signUpWithCredential(
        email: email,
        password: password,
      );
      return right(response);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ApiError(errorMessage: e.code));
      } else {
        return left(ApiError(errorMessage: e.toString()));
      }
    }
  }
}
