import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/login/domain/entity/user_entity.dart';
import 'package:lookup/res/app_constants.dart';

part 'app_profile_event.dart';
part 'app_profile_state.dart';

@lazySingleton
class AppProfileBloc extends Bloc<AppProfileEvent, AppProfileState> {
  AppProfileBloc() : super(const AppProfileState()) {
    on<AddUserDetails>(_addUserDetails);
  }

  FutureOr<void> _addUserDetails(
    AddUserDetails event,
    Emitter<AppProfileState> emit,
  ) {
    emit(state.copyWith(theStates: TheStates.sucess, user: event.user));
  }
}
