import 'package:flutter/material.dart';
import 'package:simriwinkapp/pemohon/form/keterangandomisilicontainer.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';
import 'package:http/http.dart' as http;

class keterangandomisili extends StatefulWidget {
  const keterangandomisili({Key? key}) : super(key: key);

  @override
  State<keterangandomisili> createState() => _keterangandomisiliState();
}

class _keterangandomisiliState extends State<keterangandomisili> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengajuan'),
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(242, 248, 255, 1), //#F2F8FF
      body: keterangandomisilicontainer(),
    );
  }
}
