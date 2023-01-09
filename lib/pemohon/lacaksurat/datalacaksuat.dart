import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simriwinkapp/main.dart';

class datalacaksurat extends StatelessWidget {
  final String data;
  final String metode;
  const datalacaksurat(
      {Key? key, required this.data, required String this.metode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pop(context);
            },
            label: Text("Kembali Ke Beranda"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Color.fromRGBO(242, 248, 255, 1),
        body: SafeArea(
          child: Container(
            // alignment: Alignment.center,
            child: FutureBuilder(
                future: getdata(this.data, this.metode),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.toString());
                    if (snapshot.data['statuscode'] != 200) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            child:
                                Image.asset('assets/clipboard-check-solid.png'),
                          ),
                          Text(
                            "Data Tidak Ditemukan",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );

                      // return ListView.builder(
                      //     itemCount: snapshot.data.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Center(
                      //           child: Text('snapshot.data.toString()'));
                      //     });
                    } else {
                      return SingleChildScrollView(
                        child: ListView.builder(
                          itemCount: snapshot.data['message'].length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            // return listsurat(snapshot.data['message'][index]['message'][index]);
                            return Container(
                              margin: EdgeInsets.all(16.0),
                              padding: EdgeInsets.all(16.0),
                              width: double.infinity,
                              // height: 50,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      // spreadRadius: 1,
                                      // offset: Offset(0.0, 1.0),
                                      // blurRadius: 2.0
                                    )
                                  ]),
                              // color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.data['message'][index]
                                                    ['JENIS_SURAT']
                                                .toString()
                                                .isNotEmpty
                                            ? snapshot.data['message'][index]
                                                    ['JENIS_SURAT']
                                                .toString()
                                            : '',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // diambil()
                                      if (snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() ==
                                              'null' ||
                                          snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() ==
                                              'Proses')
                                        proses(),
                                      if (snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() ==
                                              'Setujui')
                                        setujui(),
                                      if (snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() ==
                                              'Selesai')
                                        selesai(),
                                      if (snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() ==
                                              'Diambil')
                                        diambil(),
                                      if (snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['message'][index]
                                                      ['STATUS']
                                                  .toString() ==
                                              'Ditolak')
                                        ditolak(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Nomor Pengajuan  '),
                                      Spacer(),
                                      Text(snapshot.data['message'][index]
                                                  ['NOMOR_AJUAN']
                                              .toString()
                                              .isNotEmpty
                                          ? snapshot.data['message'][index]
                                                  ['NOMOR_AJUAN']
                                              .toString()
                                          : ''),
                                      Spacer(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Tanggal Pengajuan  '),
                                      Spacer(),
                                      Text(snapshot.data['message'][index]
                                                  ['CREATED_AT']
                                              .toString()
                                              .isNotEmpty
                                          ? snapshot.data['message'][index]
                                                  ['CREATED_AT']
                                              .toString()
                                          : ''),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          shrinkWrap: true,
                        ),
                      );
                    }
                    // return listsurat(snapshot.data['message'][index]['message'][1]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ));
  }

  // listsurat(BuildContext context,) {
  listsurat(
    var data,
  ) {}

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
}

Future getdata(data, metode) async {
  // var url = Uri.parse(env.host + '/track?NIK=3507161706860004');
  // var url = Uri.parse(env.host + '/track?nomor_ajuan=20220909-0001');
  var url = Uri.parse(env.host + '/layananapi/track?' + metode + '=' + data);
  var response = await http.get(url);
  print(url);
  print(response.body.toString());
  print(response.statusCode.toString());
  // return jsonDecode(response.body);
  Map<String, dynamic> userMap = jsonDecode(response.body);
  userMap['statuscode'] = response.statusCode;
  // if (response.statusCode == 200) {
  //   // print(userMap['statuscode']);

  // }
  return userMap;
}
