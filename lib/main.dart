import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simriwinkapp/env.dart';
import 'package:simriwinkapp/pemohon/homepage.dart';
import 'package:simriwinkapp/pemohon/lacaksurat/datalacaksuat.dart';
import 'package:simriwinkapp/pemohon/lacaksurat/lacaksurat.dart';
import 'package:simriwinkapp/petugas/datalaporan.dart';
import 'package:simriwinkapp/petugas/datapermohonan.dart';
import 'package:simriwinkapp/petugas/homepagepetugas.dart';
import 'package:simriwinkapp/petugas/login.dart';
import 'package:simriwinkapp/rolesscreen.dart';
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
      // home: const MyHomePage(title: 'Home Page'),
      home: splashscreen(),
      // home: login(),
      // home: homepagepetugas(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 11;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'env',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
