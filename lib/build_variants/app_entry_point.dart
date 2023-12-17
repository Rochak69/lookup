import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lookup/core/config/app_bloc.dart';

import 'package:lookup/core/config/app_config.dart';
import 'package:lookup/core/injection/dependency_injection.dart';
import 'package:lookup/features/app/app.dart';

class AppEntryPoint {
  AppEntryPoint(AppConfiguration buildVariant) {
    envSettings = buildVariant;
    initializeStartUpDependenciesAndRun(envSettings);
  }
  static AppConfiguration? envSettings;

  Future<void> initializeStartUpDependenciesAndRun(
    AppConfiguration? envSettings,
  ) async {
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };

    Bloc.observer = const AppBlocObserver();
    await configureDependencies();
    runApp(App());
  }
}
