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
  await getIt<SharedPrefsCommon>().intilialize();

  //make sure everything is initialized correctly

  //run the app
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<TrackBloc>(),
      ),
    ],
    child: TrackApp(),
  ));
}

class TrackApp extends StatelessWidget {
  const TrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme:
          ThemeData.light().copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
      title: "Track - Track Your Life",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
