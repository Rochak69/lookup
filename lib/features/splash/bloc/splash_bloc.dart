import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/res/app_images.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashEvent>((event, emit) {});
    on<CompleteHeightAnimation>(_completeHeightAnimation);
    on<ShowLoginButton>(_showLoginButton);
    on<StartLogoChange>(_startLogoChange);
    on<ChangeLogoColor>(_changeLogoColor, transformer: droppable());
  }

  FutureOr<void> _completeHeightAnimation(
    CompleteHeightAnimation event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(isHeightAnimationComplete: true));
  }

  FutureOr<void> _showLoginButton(
    ShowLoginButton event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(showLogin: true, logo: AppImages.lookupSmileThree));
  }

  FutureOr<void> _startLogoChange(
    StartLogoChange event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(logo: AppImages.lookupClose));

    await Future<dynamic>.delayed(const Duration(milliseconds: 190));
    emit(state.copyWith(logo: AppImages.lookupOpenOne));

    await Future<dynamic>.delayed(const Duration(milliseconds: 190));
    emit(state.copyWith(logo: AppImages.lookupOpenTwo));

    await Future<dynamic>.delayed(const Duration(milliseconds: 190));
    emit(state.copyWith(logo: AppImages.lookupOpenThree));

    await Future<dynamic>.delayed(const Duration(milliseconds: 190));
    emit(state.copyWith(logo: AppImages.lookupOpenFour));

    await Future<dynamic>.delayed(const Duration(milliseconds: 190));
    emit(state.copyWith(logo: AppImages.lookupSmileOne));

    await Future<dynamic>.delayed(const Duration(milliseconds: 190));
    emit(state.copyWith(logo: AppImages.lookupSmileTwo));
  }

  FutureOr<void> _changeLogoColor(
    ChangeLogoColor event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(changeLogoColor: true));
  }
}
