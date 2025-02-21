import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/core/utils/router/go_router.dart';
import 'package:track/features/common/data/data_sources/shared_prefs_common.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //setup Dependancy Injection
  setupDepInj();

  //init features
  bool output = true;

  output = await getIt<SharedPrefsCommon>().intilialize();

  //make sure everything is initialized correctly and run the app

  if (output) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TrackBloc>(),
        ),
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

class TrackApp extends StatelessWidget {
  const TrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      )),
      darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      )),
      title: "Track - Track Your Life",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
