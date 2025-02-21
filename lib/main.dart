import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/core/utils/router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //setup Dependancy Injection
  setupDepInj();

  //init features

  //make sure everything is initialized correctly

  //run the app
  runApp(TrackApp());
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
