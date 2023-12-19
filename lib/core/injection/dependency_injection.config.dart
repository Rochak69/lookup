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
import '../../features/login/data/repository/login_repository_impl.dart'
    as _i11;
import '../../features/login/data/source/login_remote_source.dart' as _i9;
import '../../features/login/domain/repository/login_repository.dart' as _i10;
import '../../features/login/domain/usecase/credential_login_usecase.dart'
    as _i16;
import '../../features/login/domain/usecase/google_login_usecase.dart' as _i17;
import '../../features/login/domain/usecase/sign_up_usecase.dart' as _i12;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i18;
import '../../features/splash/bloc/splash_bloc.dart' as _i13;
import '../../features/video_page/data/repository/feed_video_repository_impl.dart'
    as _i6;
import '../../features/video_page/data/source/feed_video_local_source.dart'
    as _i4;
import '../../features/video_page/domain/repository/feed_video_repository.dart'
    as _i5;
import '../../features/video_page/domain/usecase/get_feed_details_usecase.dart'
    as _i7;
import '../../features/video_page/domain/usecase/update_feed_usecase.dart'
    as _i14;
import '../../features/video_page/presentation/bloc/video_feed_bloc.dart'
    as _i15;
import '../hive/hive_manager.dart' as _i8;
import 'dependency_injection.dart' as _i19;

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
    gh.lazySingleton<_i4.FeedVideoLocalSource>(
        () => _i4.FeedVideoLocalSource());
    gh.lazySingleton<_i5.FeedVideoRepository>(
        () => _i6.FeedVideoRepositoryImpl(gh<_i4.FeedVideoLocalSource>()));
    gh.lazySingleton<_i7.GetFeedDetailsUsecase>(
        () => _i7.GetFeedDetailsUsecase(gh<_i5.FeedVideoRepository>()));
    gh.factory<_i8.HiveManager>(() => registerModule.hiveManager);
    gh.lazySingleton<_i9.LoginRemoteSource>(() => _i9.LoginRemoteSource());
    gh.lazySingleton<_i10.LoginRepository>(
        () => _i11.LoginRepositoryImpl(gh<_i9.LoginRemoteSource>()));
    gh.lazySingleton<_i12.SignUpUsecase>(
        () => _i12.SignUpUsecase(gh<_i10.LoginRepository>()));
    gh.factory<_i13.SplashBloc>(() => _i13.SplashBloc());
    gh.lazySingleton<_i14.UpdateFeedDetailsUsecase>(
        () => _i14.UpdateFeedDetailsUsecase(gh<_i5.FeedVideoRepository>()));
    gh.factory<_i15.VideoFeedBloc>(() => _i15.VideoFeedBloc(
          gh<_i7.GetFeedDetailsUsecase>(),
          gh<_i14.UpdateFeedDetailsUsecase>(),
        ));
    gh.lazySingleton<_i16.CredentialLoginUsecase>(
        () => _i16.CredentialLoginUsecase(gh<_i10.LoginRepository>()));
    gh.lazySingleton<_i17.GoogleLoginUsecase>(
        () => _i17.GoogleLoginUsecase(gh<_i10.LoginRepository>()));
    gh.factory<_i18.LoginBloc>(() => _i18.LoginBloc(
          gh<_i17.GoogleLoginUsecase>(),
          gh<_i16.CredentialLoginUsecase>(),
          gh<_i12.SignUpUsecase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
