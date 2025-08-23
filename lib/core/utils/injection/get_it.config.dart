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
import '../../../features/expense/data/data_sources/expense_local_data_source.dart'
    as _i944;
import '../../../features/expense/data/models/mapping_helpers/account_mappers.dart'
    as _i1057;
import '../../../features/expense/data/repo/accounts_repository_impl.dart'
    as _i217;
import '../../../features/expense/data/repo/categories_repository_impl.dart'
    as _i469;
import '../../../features/expense/data/repo/dashboard_repository_impl.dart'
    as _i540;
import '../../../features/expense/data/repo/expense_repository_impl.dart'
    as _i246;
import '../../../features/expense/domain/entities/view_entities/misc/expense_filter.dart'
    as _i1063;
import '../../../features/expense/domain/repo/accounts_repository.dart'
    as _i364;
import '../../../features/expense/domain/repo/categories_repository.dart'
    as _i956;
import '../../../features/expense/domain/repo/dashboard_repository.dart'
    as _i477;
import '../../../features/expense/domain/repo/expense_repository.dart' as _i272;
import '../../../features/expense/domain/use_cases/accounts_use_cases/get_account_details.dart'
    as _i584;
import '../../../features/expense/domain/use_cases/accounts_use_cases/get_accounts.dart'
    as _i101;
import '../../../features/expense/domain/use_cases/accounts_use_cases/modify_account.dart'
    as _i670;
import '../../../features/expense/domain/use_cases/category_use_cases/get_categories.dart'
    as _i441;
import '../../../features/expense/domain/use_cases/category_use_cases/modify_category.dart'
    as _i612;
import '../../../features/expense/domain/use_cases/dashboard_use_cases/get_dashboard_summaries.dart'
    as _i530;
import '../../../features/expense/domain/use_cases/transacation_use_case/get_transactions.dart'
    as _i1043;
import '../../../features/expense/domain/use_cases/transacation_use_case/modify_transaction.dart'
    as _i616;
import '../../../features/expense/presentation/bloc/account_details/account_details_bloc.dart'
    as _i772;
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
    gh.lazySingleton<_i288.SharedPrefsCommon>(() => _i288.SharedPrefsCommon());
    gh.lazySingleton<_i681.CheckFirstTime>(() => _i681.CheckFirstTime());
    gh.lazySingleton<_i239.InsertSampleData>(() => _i239.InsertSampleData());
    gh.lazySingleton<_i314.EnsureDefaultsIfEmpty>(
        () => _i314.EnsureDefaultsIfEmpty());
    gh.lazySingleton<_i805.TrackBloc>(() => _i805.TrackBloc());
    gh.lazySingleton<_i1057.AccountMappers>(() => _i1057.AccountMappers());
    gh.lazySingleton<_i670.AddAccount>(() => _i670.AddAccount());
    gh.lazySingleton<_i670.UpdateAccount>(() => _i670.UpdateAccount());
    gh.lazySingleton<_i670.DeleteAccount>(() => _i670.DeleteAccount());
    gh.lazySingleton<_i670.SetDefaultAccount>(() => _i670.SetDefaultAccount());
    gh.lazySingleton<_i670.IsAccountInUse>(() => _i670.IsAccountInUse());
    gh.lazySingleton<_i101.GetAccounts>(() => _i101.GetAccounts());
    gh.lazySingleton<_i584.GetAccountTransactions>(
        () => _i584.GetAccountTransactions());
    gh.lazySingleton<_i584.GetCurrentAccountBalance>(
        () => _i584.GetCurrentAccountBalance());
    gh.lazySingleton<_i441.GetCategories>(() => _i441.GetCategories());
    gh.lazySingleton<_i612.AddCategory>(() => _i612.AddCategory());
    gh.lazySingleton<_i612.UpdateCategory>(() => _i612.UpdateCategory());
    gh.lazySingleton<_i612.DeleteCategory>(() => _i612.DeleteCategory());
    gh.lazySingleton<_i612.IsCategoryInUse>(() => _i612.IsCategoryInUse());
    gh.lazySingleton<_i1043.GetTransactions>(() => _i1043.GetTransactions());
    gh.lazySingleton<_i616.AddTransaction>(() => _i616.AddTransaction());
    gh.lazySingleton<_i616.UpdateTransaction>(() => _i616.UpdateTransaction());
    gh.lazySingleton<_i530.GetRecentTransactionsSummary>(
        () => _i530.GetRecentTransactionsSummary());
    gh.lazySingleton<_i530.GetAccountDetailsSummary>(
        () => _i530.GetAccountDetailsSummary());
    gh.lazySingleton<_i530.GetAllAccountBalances>(
        () => _i530.GetAllAccountBalances());
    gh.lazySingleton<_i530.GetTodayTransactionsSummaryUC>(
        () => _i530.GetTodayTransactionsSummaryUC());
    gh.lazySingleton<_i1063.AccountFilter>(() => _i1063.AccountFilter());
    gh.factory<_i1001.TransactionsBloc>(() => _i1001.TransactionsBloc(
          gh<_i1043.GetTransactions>(),
          gh<_i616.AddTransaction>(),
          gh<_i616.UpdateTransaction>(),
        ));
    gh.factory<_i533.CategoriesBloc>(() => _i533.CategoriesBloc(
          gh<_i441.GetCategories>(),
          gh<_i612.AddCategory>(),
          gh<_i612.UpdateCategory>(),
          gh<_i612.DeleteCategory>(),
          gh<_i612.IsCategoryInUse>(),
        ));
    gh.factory<_i127.AccountsBloc>(() => _i127.AccountsBloc(
          gh<_i101.GetAccounts>(),
          gh<_i670.AddAccount>(),
          gh<_i670.UpdateAccount>(),
          gh<_i670.DeleteAccount>(),
          gh<_i670.SetDefaultAccount>(),
          gh<_i670.IsAccountInUse>(),
        ));
    gh.lazySingleton<_i590.AppPreferencesRepo>(
        () => _i1005.AppPreferencesRepoImpl());
    gh.lazySingleton<_i275.FirebaseAuthService>(
        () => _i275.FirebaseAuthService(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i591.AppDatabase>(
        () => dbModule.appDatabase(gh<_i779.Database>()));
    gh.lazySingleton<_i676.SeedRepo>(
        () => _i203.SeedRepoImpl(gh<_i591.AppDatabase>()));
    gh.lazySingleton<_i185.FirebaseAuthBloc>(() => _i185.FirebaseAuthBloc(
          gh<_i275.FirebaseAuthService>(),
          gh<_i591.AppDatabase>(),
        ));
    gh.lazySingleton<_i944.ExpenseLocalDataSource>(
        () => _i944.ExpenseLocalDataSource(gh<_i591.AppDatabase>()));
    gh.lazySingleton<_i956.CategoriesRepository>(() =>
        _i469.CategoriesRepositoryImpl(gh<_i944.ExpenseLocalDataSource>()));
    gh.lazySingleton<_i272.ExpenseRepository>(
        () => _i246.ExpenseRepositoryImpl(gh<_i944.ExpenseLocalDataSource>()));
    gh.lazySingleton<_i364.AccountsRepository>(
        () => _i217.AccountsRepositoryImpl(
              gh<_i944.ExpenseLocalDataSource>(),
              gh<_i1057.AccountMappers>(),
            ));
    gh.lazySingleton<_i477.DashboardRepository>(
        () => _i540.DashboardRepositoryImpl(
              gh<_i944.ExpenseLocalDataSource>(),
              gh<_i364.AccountsRepository>(),
            ));
    gh.factory<_i635.ExpenseDashboardBloc>(() => _i635.ExpenseDashboardBloc(
          gh<_i530.GetRecentTransactionsSummary>(),
          gh<_i530.GetAccountDetailsSummary>(),
          gh<_i530.GetAllAccountBalances>(),
          gh<_i530.GetTodayTransactionsSummaryUC>(),
          gh<_i275.FirebaseAuthService>(),
          gh<_i101.GetAccounts>(),
          gh<_i364.AccountsRepository>(),
        ));
    gh.lazySingleton<_i584.GetAccountDetailsSummary>(
        () => _i584.GetAccountDetailsSummary(gh<_i364.AccountsRepository>()));
    gh.factory<_i772.AccountDetailsBloc>(() => _i772.AccountDetailsBloc(
          gh<_i584.GetAccountDetailsSummary>(),
          gh<_i275.FirebaseAuthService>(),
        ));
    return this;
  }
}

class _$DbModule extends _i395.DbModule {}

class _$FirebaseModule extends _i643.FirebaseModule {}
