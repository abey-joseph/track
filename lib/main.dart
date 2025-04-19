import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/core/use_cases/constants/colors.dart';
import 'package:track/core/use_cases/theme/dark_theme.dart';
import 'package:track/core/use_cases/theme/light_theme.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/core/utils/router/go_router.dart';
import 'package:track/core/data_sources/shared_prefs.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';
import 'package:track/core/data_sources/sq_lite.dart';
import 'package:track/features/habit/presentation/bloc/habit_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //setup Dependancy Injection
  setupDepInj();

  //init features
  bool output = true;

  output = await getIt<SharedPrefsCommon>().intilialize();
  output = await getIt<Db>().initDatabase();

  //make sure everything is initialized correctly and run the app

  if (output) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TrackBloc>()),
        BlocProvider(
            create: (context) => getIt<HabitBloc>()..add(StartHabitEvent())),
      ],
      child: TrackApp(),
    ));
  } else {
    // if any of the initializing failed
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
              "Error initializing app - Please reach out to us through email"),
        ),
      ),
    ));
  }
}

class TrackApp extends StatefulWidget {
  const TrackApp({super.key});

  @override
  State<TrackApp> createState() => _TrackAppState();
}

class _TrackAppState extends State<TrackApp> {
  @override
  Widget build(BuildContext context) {
    //actually no purpose -- can just put Thememode.system - just keeping here in case if needed in future
    bool isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    if (isLightMode) {
      setState(() {
        getIt<ProjectColors>().changeToLight();
      });
    } else {
      getIt<ProjectColors>().changeToDark();
    }

    return MaterialApp.router(
      themeMode: isLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      title: "Track - Track Your Life",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
