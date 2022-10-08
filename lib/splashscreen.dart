import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simriwinkapp/petugas/login.dart';
import 'package:simriwinkapp/rolesscreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => rolesscreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      backgroundColor: Color.fromRGBO(242, 248, 255, 1), //#F2F8FF

      body: SafeArea(
          child: Column(children: [
        Spacer(),
        Image.asset('assets/iconori.png', height: 125),
        Spacer(),
        Text("Bekerjasama dengan: ", style: TextStyle(fontSize: 12)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo_Polinema.png', height: 55),
            Image.asset('assets/splash-remove.png', height: 55),
            Image.asset('assets/Logo_Kabupaten_Malang.png', height: 55),
          ],
        ),
      ])),
    );
  }
}
