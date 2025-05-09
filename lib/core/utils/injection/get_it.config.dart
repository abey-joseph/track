// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/common/data/repo/app_preference_repo_impl.dart'
    as _i1005;
import '../../../features/common/domain/repo/app_preferences_repo.dart'
    as _i590;
import '../../../features/common/domain/use_cases/check_first_time.dart'
    as _i681;
import '../../../features/common/presentation/bloc/track_bloc/track_bloc.dart'
    as _i805;
import '../../../features/habit/data/data_sources/habit_data_source.dart'
    as _i838;
import '../../../features/habit/data/data_sources/habit_data_source_impl.dart'
    as _i463;
import '../../../features/habit/data/repo/habit_repo_impl.dart' as _i716;
import '../../../features/habit/domain/repo/habit_repo.dart' as _i307;
import '../../../features/habit/domain/use_cases/database/add_empty_data.dart'
    as _i540;
import '../../../features/habit/domain/use_cases/database/add_habit.dart'
    as _i960;
import '../../../features/habit/domain/use_cases/database/add_status.dart'
    as _i476;
import '../../../features/habit/domain/use_cases/database/delete_habit.dart'
    as _i204;
import '../../../features/habit/domain/use_cases/database/edit_habit.dart'
    as _i871;
import '../../../features/habit/domain/use_cases/database/fetch_habits.dart'
    as _i326;
import '../../../features/habit/domain/use_cases/database/get_the_last_date.dart'
    as _i929;
import '../../../features/habit/domain/use_cases/date_head/check_for_date_difference.dart'
    as _i986;
import '../../../features/habit/domain/use_cases/date_head/get_last_5_days.dart'
    as _i856;
import '../../../features/habit/presentation/bloc/habit_bloc.dart' as _i549;
import '../../data_sources/shared_prefs.dart' as _i582;
import '../../data_sources/sq_lite.dart' as _i1012;
import '../../use_cases/constants/colors.dart' as _i411;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i411.ProjectColors>(() => _i411.ProjectColors());
    gh.lazySingleton<_i681.CheckFirstTime>(() => _i681.CheckFirstTime());
    gh.lazySingleton<_i805.TrackBloc>(() => _i805.TrackBloc());
    gh.lazySingleton<_i856.GetLast5Days>(() => _i856.GetLast5Days());
    gh.lazySingleton<_i986.CheckForDateDifference>(
        () => _i986.CheckForDateDifference());
    gh.lazySingleton<_i204.DeleteHabitUseCase>(
        () => _i204.DeleteHabitUseCase());
    gh.lazySingleton<_i871.EditHabitUseCase>(() => _i871.EditHabitUseCase());
    gh.lazySingleton<_i582.SharedPrefsCommon>(() => _i582.SharedPrefsCommon());
    gh.lazySingleton<_i1012.Db>(() => _i1012.Db());
    gh.lazySingleton<_i838.HabitDataSource>(
        () => _i463.HabitDataSourceImpl(gh<_i1012.Db>()));
    gh.lazySingleton<_i307.HabitRepo>(
        () => _i716.HabitRepoImpl(gh<_i838.HabitDataSource>()));
    gh.lazySingleton<_i326.FetchHabitsDataToUpdateMainUIUseCase>(() =>
        _i326.FetchHabitsDataToUpdateMainUIUseCase(
            habitRepo: gh<_i307.HabitRepo>()));
    gh.lazySingleton<_i476.AddStatus>(
        () => _i476.AddStatus(habitRepo: gh<_i307.HabitRepo>()));
    gh.lazySingleton<_i590.AppPreferencesRepo>(
        () => _i1005.AppPreferencesRepoImpl());
    gh.lazySingleton<_i929.GetTheLastDate>(
        () => _i929.GetTheLastDate(gh<_i307.HabitRepo>()));
    gh.lazySingleton<_i960.AddHabitUseCase>(
        () => _i960.AddHabitUseCase(gh<_i307.HabitRepo>()));
    gh.lazySingleton<_i540.AddEmptyData>(
        () => _i540.AddEmptyData(gh<_i307.HabitRepo>()));
    gh.factory<_i549.HabitBloc>(() => _i549.HabitBloc(
          gh<_i856.GetLast5Days>(),
          gh<_i929.GetTheLastDate>(),
          gh<_i986.CheckForDateDifference>(),
          gh<_i960.AddHabitUseCase>(),
          gh<_i871.EditHabitUseCase>(),
          gh<_i204.DeleteHabitUseCase>(),
          gh<_i326.FetchHabitsDataToUpdateMainUIUseCase>(),
          gh<_i540.AddEmptyData>(),
          gh<_i476.AddStatus>(),
        ));
    return this;
  }
}
