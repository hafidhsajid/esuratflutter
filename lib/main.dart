import 'package:flutter/material.dart';
import 'package:simriwinkapp/env.dart';
import 'package:simriwinkapp/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

Env env = new Env();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Simriwink APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue,
      ),
      // debugShowCheckedModeBanner: false,
      // home: formpengajuan(),
      home: splashscreen(),
    );
  }
}
