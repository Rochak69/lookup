import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/hive/hive_manager.dart';

import 'package:lookup/core/injection/dependency_injection.config.dart';

final sl = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => sl.init();

@module
abstract class RegisterModule {
  @postConstruct
  HiveManager get hiveManager => HiveManager.instance;
}
