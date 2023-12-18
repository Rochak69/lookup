import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/usecase/usecase.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/login/domain/entity/user_entity.dart';
import 'package:lookup/features/login/domain/usecase/credential_login_usecase.dart';
import 'package:lookup/features/login/domain/usecase/google_login_usecase.dart';
import 'package:lookup/features/login/domain/usecase/sign_up_usecase.dart';
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._googleLoginUsecase,
    this._credentialLoginUsecase,
    this._signUpUsecase,
  ) : super(const LoginState()) {
    on<PasswordTypingEvent>(_handlePasswordTyping);
    on<GoogleLoginEvent>(loginWithGoogle, transformer: droppable());
    on<CredentialLoginEvent>(_credentialLogin, transformer: droppable());
    on<SignUpWthCredentialEvent>(
      _signUpWithCredential,
      transformer: droppable(),
    );
  }
  final GoogleLoginUsecase _googleLoginUsecase;
  final CredentialLoginUsecase _credentialLoginUsecase;
  final SignUpUsecase _signUpUsecase;

  FutureOr<void> loginWithGoogle(
    GoogleLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(theStates: TheStates.loadng));
    final result = await _googleLoginUsecase.call(NoParam());
    result.fold((l) {
      emit(
        state.copyWith(
          theStates: TheStates.error,
          errorMessage: l.errorMessage,
        ),
      );
    }, (r) {
      emit(state.copyWith(theStates: TheStates.sucess, user: r));
    });
  }

  FutureOr<void> _credentialLogin(
    CredentialLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(theStates: TheStates.loadng));
    final result = await _credentialLoginUsecase.call(
      CredentialLoginParam(email: event.email, password: event.password),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          theStates: TheStates.error,
          errorMessage: l.errorMessage,
        ),
      );
    }, (r) {
      emit(state.copyWith(theStates: TheStates.sucess, user: r));
    });
  }

  FutureOr<void> _signUpWithCredential(
    SignUpWthCredentialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(theStates: TheStates.loadng));
    final result = await _signUpUsecase.call(
      CredentialLoginParam(email: event.email, password: event.password),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          theStates: TheStates.error,
          errorMessage: l.errorMessage,
        ),
      );
    }, (r) {
      emit(state.copyWith(theStates: TheStates.sucess, user: r));
    });
  }

  FutureOr<void> _handlePasswordTyping(
    PasswordTypingEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isTypingPassword: event.isTyping));
  }
}
