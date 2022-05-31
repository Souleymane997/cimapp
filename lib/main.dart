import 'package:cimapp/widgets/hompage.dart';
import 'package:cimapp/widgets/launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const Launch(),//  HomePage(), ,
      debugShowCheckedModeBanner: false,
    );
  }
}
