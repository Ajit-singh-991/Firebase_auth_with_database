import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:welcome_screen/pages/Registration_page.dart';
import 'package:welcome_screen/pages/neumorphic_page.dart';
import 'package:welcome_screen/pages/welcome_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData(
        primaryColor: Vx.purple500,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=> const WelcomePage(),
        "neumorphicRoute":(context) => const NeumorphicPage(),
        "welcomePageRoute":(context) => const WelcomePage(),
        "registrationRoute":(context) => const Registration(),
        
      },
    );
  }
}