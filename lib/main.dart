import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  doWhenWindowReady(() {
    var initialSize = Size(1600, 900);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
  });
  await Window.initialize();
  await Window.setEffect(
    effect: WindowEffect.aero,
    color: Color.fromARGB(50, 0, 0, 0),
  );
  //This is for the window app effect i guess
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Police System',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        //   primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
