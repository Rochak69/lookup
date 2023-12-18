// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/app/bloc/app_profile_bloc.dart' as _i3;
import '../../features/login/data/repository/login_repository_impl.dart' as _i7;
import '../../features/login/data/source/login_remote_source.dart' as _i5;
import '../../features/login/domain/repository/login_repository.dart' as _i6;
import '../../features/login/domain/usecase/credential_login_usecase.dart'
    as _i10;
import '../../features/login/domain/usecase/google_login_usecase.dart' as _i11;
import '../../features/login/domain/usecase/sign_up_usecase.dart' as _i8;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i12;
import '../../features/video_page/presentation/bloc/video_feed_bloc.dart'
    as _i9;
import '../hive/hive_manager.dart' as _i4;
import 'dependency_injection.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppProfileBloc>(() => _i3.AppProfileBloc());
    gh.factory<_i4.HiveManager>(() => registerModule.hiveManager);
    gh.lazySingleton<_i5.LoginRemoteSource>(() => _i5.LoginRemoteSource());
    gh.lazySingleton<_i6.LoginRepository>(
        () => _i7.LoginRepositoryImpl(gh<_i5.LoginRemoteSource>()));
    gh.lazySingleton<_i8.SignUpUsecase>(
        () => _i8.SignUpUsecase(gh<_i6.LoginRepository>()));
    gh.factory<_i9.VideoFeedBloc>(() => _i9.VideoFeedBloc());
    gh.lazySingleton<_i10.CredentialLoginUsecase>(
        () => _i10.CredentialLoginUsecase(gh<_i6.LoginRepository>()));
    gh.lazySingleton<_i11.GoogleLoginUsecase>(
        () => _i11.GoogleLoginUsecase(gh<_i6.LoginRepository>()));
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc(
          gh<_i11.GoogleLoginUsecase>(),
          gh<_i10.CredentialLoginUsecase>(),
          gh<_i8.SignUpUsecase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
