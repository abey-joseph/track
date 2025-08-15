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
import 'package:sqflite/sqflite.dart' as _i779;

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
import '../../../features/expense/data/data_source/expense_local_data_source.dart'
    as _i23;
import '../../../features/expense/data/data_source/expense_local_data_source_impl.dart'
    as _i782;
import '../../../features/expense/data/repo/expense_repository_impl.dart'
    as _i246;
import '../../../features/expense/domain/repo/expense_repository.dart' as _i272;
import '../../../features/expense/domain/use_cases/get_dashboard_data.dart'
    as _i1018;
import '../../../features/expense/domain/use_cases/get_recent_transactions.dart'
    as _i438;
import '../../../features/expense/domain/use_cases/get_today_transactions.dart'
    as _i449;
import '../../../features/expense/domain/use_cases/get_transaction_count_in_period.dart'
    as _i1066;
import '../../../features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart'
    as _i635;
import '../../auth/firebase_module.dart' as _i643;
import '../../auth/firebase_services.dart' as _i275;
import '../../database/database/app_database.dart' as _i591;
import '../../database/database/database_pre_resolve.dart' as _i395;
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
    final dbModule = _$DbModule();
    final firebaseModule = _$FirebaseModule();
    await gh.lazySingletonAsync<_i779.Database>(
      () => dbModule.database,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i982.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i411.ProjectColors>(() => _i411.ProjectColors());
    gh.lazySingleton<_i288.SharedPrefsCommon>(() => _i288.SharedPrefsCommon());
    gh.lazySingleton<_i681.CheckFirstTime>(() => _i681.CheckFirstTime());
    gh.lazySingleton<_i805.TrackBloc>(() => _i805.TrackBloc());
    gh.lazySingleton<_i590.AppPreferencesRepo>(
        () => _i1005.AppPreferencesRepoImpl());
    gh.lazySingleton<_i275.FirebaseAuthService>(
        () => _i275.FirebaseAuthService(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i591.AppDatabase>(
        () => dbModule.appDatabase(gh<_i779.Database>()));
    gh.lazySingleton<_i23.ExpenseLocalDataSource>(
        () => _i782.ExpenseLocalDataSourceImpl(gh<_i591.AppDatabase>()));
    gh.lazySingleton<_i272.ExpenseRepository>(
        () => _i246.ExpenseRepositoryImpl(gh<_i23.ExpenseLocalDataSource>()));
    gh.factory<_i185.FirebaseAuthBloc>(() => _i185.FirebaseAuthBloc(
          gh<_i275.FirebaseAuthService>(),
          gh<_i591.AppDatabase>(),
        ));
    gh.factory<_i438.GetRecentTransactions>(
        () => _i438.GetRecentTransactions(gh<_i272.ExpenseRepository>()));
    gh.factory<_i1066.GetTransactionCountInPeriod>(() =>
        _i1066.GetTransactionCountInPeriod(gh<_i272.ExpenseRepository>()));
    gh.factory<_i449.GetTodayTransactions>(
        () => _i449.GetTodayTransactions(gh<_i272.ExpenseRepository>()));
    gh.factory<_i1018.GetDashboardData>(() => _i1018.GetDashboardData(
          gh<_i438.GetRecentTransactions>(),
          gh<_i1066.GetTransactionCountInPeriod>(),
          gh<_i449.GetTodayTransactions>(),
        ));
    gh.factory<_i635.ExpenseDashboardBloc>(
        () => _i635.ExpenseDashboardBloc(gh<_i1018.GetDashboardData>()));
    return this;
  }
}

class _$DbModule extends _i395.DbModule {}

class _$FirebaseModule extends _i643.FirebaseModule {}
