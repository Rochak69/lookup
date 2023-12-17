import 'package:lookup/build_variants/app_entry_point.dart';

class DevelopmentEntryPoint extends AppEntryPoint {
  DevelopmentEntryPoint(super.appConfig);
}

class ProductionEntryPoint extends AppEntryPoint {
  ProductionEntryPoint(super.appConfig);
}

class StagingEntryPoint extends AppEntryPoint {
  StagingEntryPoint(super.appConfig);
}
