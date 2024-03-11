import 'package:dart_location_app/Provider/Forgot%20password.provider.dart';
import 'package:dart_location_app/Provider/Login_Screen%20Provider.dart';
import 'package:dart_location_app/Provider/RegisterProvider.dart';
import 'package:dart_location_app/Provider/ThemeChangerProvider.dart';
import 'package:dart_location_app/utills/Routes/Routes%20Name.dart';
import 'package:dart_location_app/utills/Routes/RoutesInitilaze.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider( create: (_) => RegisterProvider()),
          ChangeNotifierProvider( create: (_) => LoginProvider()),
          ChangeNotifierProvider( create: (_) => ForgotPasswordProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger())

        ],
    child: Builder(builder: (BuildContext context){
      final themeChanger = Provider.of<ThemeChanger>(context);
      return MaterialApp(
        title: 'Live Location Tracking App',
        themeMode: themeChanger.themeMode,
        theme: ThemeData(
          useMaterial3: true,

// Define the default brightness and colors.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
// ···
            brightness: Brightness.light,
          ),

          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
// ···
            titleLarge: GoogleFonts.oswald(
              fontSize: 30,
              fontStyle: FontStyle.normal,
            ),
            bodyMedium: GoogleFonts.aBeeZee(),
            displaySmall: GoogleFonts.pacifico(),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      );
    })
    );
  }
}
