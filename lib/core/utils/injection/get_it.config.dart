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
import '../../../features/common/data/repo/seed_repo_impl.dart' as _i203;
import '../../../features/common/domain/repo/app_preferences_repo.dart'
    as _i590;
import '../../../features/common/domain/repo/seed_repo.dart' as _i676;
import '../../../features/common/domain/use_cases/check_first_time.dart'
    as _i681;
import '../../../features/common/domain/use_cases/ensure_defaults_if_empty.dart'
    as _i314;
import '../../../features/common/domain/use_cases/insert_sample_data.dart'
    as _i239;
import '../../../features/common/presentation/bloc/track_bloc/track_bloc.dart'
    as _i805;
import '../../../features/expense/data/data_sources/accounts_local_data_source.dart'
    as _i273;
import '../../../features/expense/data/data_sources/categories_local_data_source.dart'
    as _i964;
import '../../../features/expense/data/data_sources/expense_local_data_source.dart'
    as _i944;
import '../../../features/expense/data/repo/accounts_repository_impl.dart'
    as _i217;
import '../../../features/expense/data/repo/categories_repository_impl.dart'
    as _i469;
import '../../../features/expense/data/repo/dashboard_repository_impl.dart'
    as _i540;
import '../../../features/expense/data/repo/expense_repository_impl.dart'
    as _i246;
import '../../../features/expense/domain/repo/accounts_repository.dart'
    as _i364;
import '../../../features/expense/domain/repo/categories_repository.dart'
    as _i956;
import '../../../features/expense/domain/repo/dashboard_repository.dart'
    as _i477;
import '../../../features/expense/domain/repo/expense_repository.dart' as _i272;
import '../../../features/expense/domain/use_cases/get_accounts.dart' as _i704;
import '../../../features/expense/domain/use_cases/get_categories.dart'
    as _i884;
import '../../../features/expense/domain/use_cases/get_dashboard_summaries.dart'
    as _i1019;
import '../../../features/expense/domain/use_cases/get_transactions.dart'
    as _i801;
import '../../../features/expense/domain/use_cases/modify_account.dart'
    as _i465;
import '../../../features/expense/domain/use_cases/modify_category.dart'
    as _i513;
import '../../../features/expense/domain/use_cases/modify_transaction.dart'
    as _i311;
import '../../../features/expense/presentation/bloc/accounts/accounts_bloc.dart'
    as _i127;
import '../../../features/expense/presentation/bloc/categories/categories_bloc.dart'
    as _i533;
import '../../../features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart'
    as _i635;
import '../../../features/expense/presentation/bloc/transactions/transactions_bloc.dart'
    as _i1001;
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
    gh.lazySingleton<_i801.GetTransactions>(() => _i801.GetTransactions());
    gh.lazySingleton<_i513.AddCategory>(() => _i513.AddCategory());
    gh.lazySingleton<_i513.UpdateCategory>(() => _i513.UpdateCategory());
    gh.lazySingleton<_i513.DeleteCategory>(() => _i513.DeleteCategory());
    gh.lazySingleton<_i513.IsCategoryInUse>(() => _i513.IsCategoryInUse());
    gh.lazySingleton<_i884.GetCategories>(() => _i884.GetCategories());
    gh.lazySingleton<_i704.GetAccounts>(() => _i704.GetAccounts());
    gh.lazySingleton<_i465.AddAccount>(() => _i465.AddAccount());
    gh.lazySingleton<_i465.UpdateAccount>(() => _i465.UpdateAccount());
    gh.lazySingleton<_i465.DeleteAccount>(() => _i465.DeleteAccount());
    gh.lazySingleton<_i465.SetDefaultAccount>(() => _i465.SetDefaultAccount());
    gh.lazySingleton<_i465.IsAccountInUse>(() => _i465.IsAccountInUse());
    gh.lazySingleton<_i311.AddTransaction>(() => _i311.AddTransaction());
    gh.lazySingleton<_i311.UpdateTransaction>(() => _i311.UpdateTransaction());
    gh.lazySingleton<_i288.SharedPrefsCommon>(() => _i288.SharedPrefsCommon());
    gh.lazySingleton<_i681.CheckFirstTime>(() => _i681.CheckFirstTime());
    gh.lazySingleton<_i239.InsertSampleData>(() => _i239.InsertSampleData());
    gh.lazySingleton<_i314.EnsureDefaultsIfEmpty>(
        () => _i314.EnsureDefaultsIfEmpty());
    gh.lazySingleton<_i805.TrackBloc>(() => _i805.TrackBloc());
    gh.lazySingleton<_i1019.GetRecentTransactionsSummary>(
        () => _i1019.GetRecentTransactionsSummary());
    gh.lazySingleton<_i1019.GetAccountDetailsSummary>(
        () => _i1019.GetAccountDetailsSummary());
    gh.lazySingleton<_i1019.GetAllAccountBalances>(
        () => _i1019.GetAllAccountBalances());
    gh.lazySingleton<_i1019.GetTodayTransactionsSummaryUC>(
        () => _i1019.GetTodayTransactionsSummaryUC());
    gh.lazySingleton<_i590.AppPreferencesRepo>(
        () => _i1005.AppPreferencesRepoImpl());
    gh.factory<_i127.AccountsBloc>(() => _i127.AccountsBloc(
          gh<_i704.GetAccounts>(),
          gh<_i465.AddAccount>(),
          gh<_i465.UpdateAccount>(),
          gh<_i465.DeleteAccount>(),
          gh<_i465.SetDefaultAccount>(),
          gh<_i465.IsAccountInUse>(),
        ));
    gh.lazySingleton<_i275.FirebaseAuthService>(
        () => _i275.FirebaseAuthService(gh<_i59.FirebaseAuth>()));
    gh.factory<_i533.CategoriesBloc>(() => _i533.CategoriesBloc(
          gh<_i884.GetCategories>(),
          gh<_i513.AddCategory>(),
          gh<_i513.UpdateCategory>(),
          gh<_i513.DeleteCategory>(),
          gh<_i513.IsCategoryInUse>(),
        ));
    gh.lazySingleton<_i591.AppDatabase>(
        () => dbModule.appDatabase(gh<_i779.Database>()));
    gh.factory<_i635.ExpenseDashboardBloc>(() => _i635.ExpenseDashboardBloc(
          gh<_i1019.GetRecentTransactionsSummary>(),
          gh<_i1019.GetAccountDetailsSummary>(),
          gh<_i1019.GetAllAccountBalances>(),
          gh<_i1019.GetTodayTransactionsSummaryUC>(),
          gh<_i275.FirebaseAuthService>(),
          gh<_i704.GetAccounts>(),
        ));
    gh.factory<_i1001.TransactionsBloc>(() => _i1001.TransactionsBloc(
          gh<_i801.GetTransactions>(),
          gh<_i311.AddTransaction>(),
          gh<_i311.UpdateTransaction>(),
        ));
    gh.lazySingleton<_i676.SeedRepo>(
        () => _i203.SeedRepoImpl(gh<_i591.AppDatabase>()));
    gh.lazySingleton<_i185.FirebaseAuthBloc>(() => _i185.FirebaseAuthBloc(
          gh<_i275.FirebaseAuthService>(),
          gh<_i591.AppDatabase>(),
        ));
    gh.lazySingleton<_i273.AccountsLocalDataSource>(
        () => _i273.AccountsLocalDataSource(gh<_i591.AppDatabase>()));
    gh.lazySingleton<_i944.ExpenseLocalDataSource>(
        () => _i944.ExpenseLocalDataSource(gh<_i591.AppDatabase>()));
    gh.lazySingleton<_i964.CategoriesLocalDataSource>(
        () => _i964.CategoriesLocalDataSource(gh<_i591.AppDatabase>()));
    gh.lazySingleton<_i272.ExpenseRepository>(
        () => _i246.ExpenseRepositoryImpl(gh<_i944.ExpenseLocalDataSource>()));
    gh.lazySingleton<_i956.CategoriesRepository>(() =>
        _i469.CategoriesRepositoryImpl(gh<_i964.CategoriesLocalDataSource>()));
    gh.lazySingleton<_i364.AccountsRepository>(() =>
        _i217.AccountsRepositoryImpl(gh<_i273.AccountsLocalDataSource>()));
    gh.lazySingleton<_i477.DashboardRepository>(
        () => _i540.DashboardRepositoryImpl(
              gh<_i944.ExpenseLocalDataSource>(),
              gh<_i364.AccountsRepository>(),
            ));
    return this;
  }
}

class _$DbModule extends _i395.DbModule {}

class _$FirebaseModule extends _i643.FirebaseModule {}
