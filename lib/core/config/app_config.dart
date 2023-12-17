import 'package:lookup/build_variants/enum.dart';

class AppConfiguration {
  AppConfiguration({
    required this.appEnvironment,
  });
  final AppEnvironment appEnvironment;

  static final development = AppConfiguration(
    appEnvironment: AppEnvironment.development,
  );

  static final staging = AppConfiguration(
    appEnvironment: AppEnvironment.staging,
  );
  static final production = AppConfiguration(
    appEnvironment: AppEnvironment.production,
  );
}
