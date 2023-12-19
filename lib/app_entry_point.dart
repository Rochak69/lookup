import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:lookup/core/config/app_bloc.dart';
import 'package:lookup/core/config/app_config.dart';
import 'package:lookup/core/hive/hive_manager.dart';
import 'package:lookup/core/injection/dependency_injection.dart';
import 'package:lookup/core/logger/pretty_logger.dart';
import 'package:lookup/features/app/app.dart';
import 'package:lookup/firebase_options.dart';

class AppEntryPoint {
  AppEntryPoint(AppConfiguration buildVariant) {
    envSettings = buildVariant;
    initializeStartUpDependenciesAndRun(envSettings);
  }
  static AppConfiguration? envSettings;

  Future<void> initializeStartUpDependenciesAndRun(
    AppConfiguration? envSettings,
  ) async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      PrettyLogger.logger.e(
        details.exceptionAsString(),
        stackTrace: details.stack,
        error: details,
      );
    };
    unawaited(setHightRefreshRate());
    Bloc.observer = const AppBlocObserver();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await configureDependencies();
    await sl<HiveManager>().init();

    runApp(App());
  }

  Future<void> setHightRefreshRate() async {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      PrettyLogger.logger.e(e.toString());
    }
  }
}
