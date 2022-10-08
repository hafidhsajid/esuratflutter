import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/petugas/datalaporan.dart';
import 'package:simriwinkapp/petugas/datapermohonan.dart';
import 'package:simriwinkapp/petugas/homepagepetugas.dart';
import 'package:http/http.dart' as http;

class detailpermohonan extends StatefulWidget {
  final data;
  const detailpermohonan({Key? key, required this.data}) : super(key: key);

  @override
  State<detailpermohonan> createState() => _detailpermohonanState();
}

class _detailpermohonanState extends State<detailpermohonan> {
  // bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    // var _data = jsonde(widget.data.toString());
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Detail Data Permohonan',
        //       style: TextStyle(
        //           fontSize: 24,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.black)),
        appBar: AppBar(
          title: const Text('Detail Data Permohonan'),
          toolbarHeight: 80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(242, 248, 255, 1),
        //   actions: [
        //     GestureDetector(
        //       child: Image.asset('assets/logout.png', height: 80),
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //     )
        //   ],
        // ),
        //backgroundColor: Colors.white,

        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.values[5],
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // crossAxisAlignment: WrapCrossAlignment.values[5],
                      // runAlignment: WrapAlignment.values,

                      direction: Axis.vertical,
                      spacing: 10,
                      // runSpacing: 20,

                      children: [
                        // Text(widget.data.toString()),
                        Text(
                          'JENIS SURAT ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['JENIS_SURAT'].toString()),
                        Text(
                          'NOMOR_AJUAN ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['NOMOR_AJUAN'].toString()),
                        Text(
                          'NIK ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['NIK'].toString()),
                        Text(
                          'NAMA ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['NAMA'].toString()),
                        Text(
                          'TEMPAT_LAHIR ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['TEMPAT_LAHIR'].toString()),
                        Text(
                          'TANGGAL_LAHIR ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['TANGGAL_LAHIR'].toString()),
                        Text(
                          'JENIS_KELAMIN ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['JENIS_KELAMIN'].toString()),
                        Text(
                          'STATUS_KAWIN ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['STATUS_KAWIN'].toString()),
                        Text(
                          'JENIS_PEKERJAAN ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['JENIS_PEKERJAAN'].toString()),
                        Text(
                          'ALAMAT ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['ALAMAT'].toString()),
                        Text(
                          'AGAMA ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.data['AGAMA'].toString()),
                        Text(
                          'STATUS ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        // Text(widget.data['STATUS'].toString()),
                        if (widget.data['STATUS_PENGAJUAN'].toString() ==
                                'null' ||
                            widget.data['STATUS_PENGAJUAN'].toString() == '1')
                          proses(),
                        if (widget.data['STATUS_PENGAJUAN'].toString() !=
                                'null' &&
                            widget.data['STATUS_PENGAJUAN'].toString() == '2')
                          setujui(),
                        if (widget.data['STATUS_PENGAJUAN'].toString() !=
                                'null' &&
                            widget.data['STATUS_PENGAJUAN'].toString() == '3')
                          selesai(),
                        if (widget.data['STATUS_PENGAJUAN'].toString() !=
                                'null' &&
                            widget.data['STATUS_PENGAJUAN'].toString() == '4')
                          diambil(),
                        if (widget.data['STATUS_PENGAJUAN'].toString() !=
                                'null' &&
                            widget.data['STATUS_PENGAJUAN'].toString() == '9')
                          ditolak(),
                      ],
                    )),
              ),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Setujui Permohonan',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          if (!_isloading) aksi(),
                          if (_isloading) CircularProgressIndicator(),
                        ],
                      )))
            ],
          )),
        ));
  }

  aksi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Text('Tidak'),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () {
              tolakpermohonan(widget.data['ID_INC'], '2');
              setState(() {
                _isloading = true;
              });
            },
            child:
                // Text('Tidak')
                Row(
              children: [
                Icon(Icons.close),
                Text('Tidak'),
              ],
            )),
        // Text('Setuju'),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onPressed: () {
              setujupermohonan(widget.data['ID_INC'], '2');
              setState(() {
                _isloading = true;
              });
            },
            child: Row(
              children: [Icon(Icons.check), Text('Setuju')],
            ))
      ],
    );
  }

  proses() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.yellow),
      child: Text('Proses', style: TextStyle(color: Colors.black)),
    );
  }

  setujui() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
      child: Text('Setujui', style: TextStyle(color: Colors.white)),
    );
  }

  selesai() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.grey),
      child: Text('Selesai', style: TextStyle(color: Colors.white)),
    );
  }

  diambil() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.green),
      child: Text('Diambil', style: TextStyle(color: Colors.white)),
    );
  }

  ditolak() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.red),
      child: Text('Ditolak', style: TextStyle(color: Colors.white)),
    );
  }

  Future setujupermohonan(String id, String aksi) async {
    var url = Uri.parse(env.host + '/petugasapi/homeapi/setuju');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'INC_USER': id,
      }),
    );

    Map<String, dynamic> userMap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(userMap['message']),
        duration: Duration(seconds: 3),
      ));
      Navigator.pop(context);
    } else {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(userMap['message']),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
    }
    // print(userMap.toString());

    return userMap;
  }

  Future tolakpermohonan(String id, String aksi) async {
    var url = Uri.parse(env.host + '/petugasapi/homeapi/tolak');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'INC_USER': id,
      }),
    );

    Map<String, dynamic> userMap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(userMap['message']),
        duration: Duration(seconds: 3),
      ));
      Navigator.pop(context);
    } else {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(userMap['message']),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
    }
    // print(userMap.toString());

    return userMap;
  }
}

bool _isloading = false;
