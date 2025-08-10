// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/auth/presentation/bloc/firebase_auth_bloc.dart'
    as _i185;
import '../../../features/common/data/data_sources/shared_prefs_common.dart'
    as _i288;
import '../../../features/common/data/repo/app_preference_repo_impl.dart'
    as _i1005;
import '../../../features/common/domain/repo/app_preferences_repo.dart'
    as _i590;
import '../../../features/common/domain/use_cases/check_first_time.dart'
    as _i681;
import '../../../features/common/presentation/bloc/track_bloc/track_bloc.dart'
    as _i805;
import '../../auth/firebase_module.dart' as _i643;
import '../../auth/firebase_services.dart' as _i275;
import '../../use_cases/constants/colors.dart' as _i411;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i411.ProjectColors>(() => _i411.ProjectColors());
    gh.lazySingleton<_i288.SharedPrefsCommon>(() => _i288.SharedPrefsCommon());
    gh.lazySingleton<_i681.CheckFirstTime>(() => _i681.CheckFirstTime());
    gh.lazySingleton<_i805.TrackBloc>(() => _i805.TrackBloc());
    await gh.lazySingletonAsync<_i982.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i185.FirebaseAuthBloc>(() => _i185.FirebaseAuthBloc());
    gh.lazySingleton<_i590.AppPreferencesRepo>(
        () => _i1005.AppPreferencesRepoImpl());
    gh.lazySingleton<_i275.FirebaseAuthService>(
        () => _i275.FirebaseAuthService(gh<_i59.FirebaseAuth>()));
    return this;
  }
}

class _$FirebaseModule extends _i643.FirebaseModule {}
