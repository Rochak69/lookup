import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/features/login/data/model/user_model.dart';

@lazySingleton
class LoginRemoteSource {
  Future<UserModel> googleLogin() async {
    final googleSignIn = GoogleSignIn();
    final response = await googleSignIn.signIn();
    if (response?.email == null) {
      throw InternalAppError(errorMessage: 'Error');
    }
    final authentication = await response?.authentication;

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      GoogleAuthProvider.credential(
        accessToken: authentication?.accessToken,
        idToken: authentication?.idToken,
      ),
    );

    return UserModel(
      email: userCredential.user?.email,
      name: userCredential.user?.displayName,
      uuid: userCredential.user?.uid,
    );
  }

  Future<UserModel> signInWithPassword({
    required String email,
    required String password,
  }) async {
    final response = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return UserModel(
      email: response.user?.email,
      name: response.user?.displayName,
      uuid: response.user?.uid,
    );
  }

  Future<UserModel> signUpWithCredential({
    required String email,
    required String password,
  }) async {
    final response = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return UserModel(
      email: response.user?.email,
      name: response.user?.displayName,
      uuid: response.user?.uid,
    );
  }
}
