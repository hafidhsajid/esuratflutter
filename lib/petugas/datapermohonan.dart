import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/petugas/datalaporan.dart';
import 'package:simriwinkapp/petugas/detailpermohonan.dart';
import 'package:simriwinkapp/petugas/homepagepetugas.dart';
import 'package:http/http.dart' as http;
import 'package:simriwinkapp/petugas/login.dart';

class datapermohonan extends StatefulWidget {
  const datapermohonan({Key? key}) : super(key: key);

  @override
  State<datapermohonan> createState() => _datapermohonanState();
}

class _datapermohonanState extends State<datapermohonan> {
  String dropdownValue = list.elementAt(2);
  String jenissuratValue = jenissuratlist.first;
  String tmp = 'a';
  Map data = {};
  String res = "";
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Petugas',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        backgroundColor: Color.fromRGBO(242, 248, 255, 1),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          GestureDetector(
            child: Image.asset('assets/logout.png', height: 80),
            onTap: () {
              // Navigator.pop(context);
              showDialog<String>(
                context: context,
                builder: (BuildContext _context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Apakah anda ingin melakukan logout'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(_context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pop(_context, 'OK');
                        // Navigator.pop(context);
                        Navigator.popUntil(context, (route) => false);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => login()));
                        setState(() {});
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(242, 248, 255, 1), //#F2F8FF
      //backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return homepagepetugas();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Data Pemohonan'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return datapermohonan();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Laporan'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return datalaporan();
                }));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Jenis Surat',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: jenissuratValue,
                  style: TextStyle(color: Colors.black),
                  elevation: 16,
                  underline: SizedBox(),
                  onChanged: (String? value) {
                    setState(() {
                      jenissuratValue = value.toString();
                      // data.forEach((element) {
                      //   // int index = list.indexOf('Keterangan Domisili');
                      //   if (element.name == 'Keterangan Domisili') {
                      //     int idx = data.indexOf(element);
                      //     data[idx] = _SuratData(
                      //         'Keterangan Domisili',
                      //         double.parse(dropdownValue) - 1500,
                      //         Color.fromRGBO(0, 58, 126, 1));
                      //     // print(element.);
                      //   }
                      // });
                    });
                  },
                  items: jenissuratlist
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, textAlign: TextAlign.center),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Tahun',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  style: TextStyle(color: Colors.black),
                  elevation: 16,
                  underline: SizedBox(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value.toString();
                      // data.forEach((element) {
                      //   // int index = list.indexOf('Keterangan Domisili');
                      //   if (element.name == 'Keterangan Domisili') {
                      //     int idx = data.indexOf(element);
                      //     data[idx] = _SuratData(
                      //         'Keterangan Domisili',
                      //         double.parse(dropdownValue) - 1500,
                      //         Color.fromRGBO(0, 58, 126, 1));
                      //     // print(element.);
                      //   }
                      // });
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, textAlign: TextAlign.center),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          FutureBuilder(
              future:
                  getdata(dropdownValue.toString(), jenissuratValue.toString()),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data['statuscode'] != 200) {
                    return Text(snapshot.data['data'].toString());
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index) {
                      print(snapshot.data['data'][index]['STATUS_PENGAJUAN']
                          .toString());
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return detailpermohonan(
                                  data: snapshot.data['data'][index]);
                            })).then((value) => setState(() {}));
                          },
                          child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.data['data'][index]
                                                ['NOMOR_AJUAN']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      if (snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() ==
                                              'null' ||
                                          snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() ==
                                              '1')
                                        proses(),
                                      if (snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() ==
                                              '2')
                                        setujui(),
                                      if (snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() ==
                                              '3')
                                        selesai(),
                                      if (snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() ==
                                              '4')
                                        diambil(),
                                      if (snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() !=
                                              'null' &&
                                          snapshot.data['data'][index]
                                                      ['STATUS_PENGAJUAN']
                                                  .toString() ==
                                              '9')
                                        ditolak(),
                                    ],
                                  ),
                                  Text(
                                    snapshot.data['data'][index]['JENIS_SURAT']
                                        .toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    snapshot.data['data'][index]['CREATED_AT']
                                        .toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  // Text(snapshot.data['data'][index]
                                  //     .toString()),
                                ],
                              )),
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
                // }));
              }),
        ]),
      )

          //   child: Column(children: [
          //     Padding(
          //             padding: const EdgeInsets.all(16.0),
          //             child: Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(30.0)),
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          //                 child: DropdownButton<String>(
          //                   isExpanded: true,
          //                   value: dropdownValue,
          //                   style: TextStyle(color: Colors.black),
          //                   elevation: 16,
          //                   underline: SizedBox(),
          //                   onChanged: (String? value) {
          //                     setState(() {
          //                       dropdownValue = value.toString();
          //                       data.forEach((element) {
          //                         // int index = list.indexOf('Keterangan Domisili');
          //                         if (element.name == 'Keterangan Domisili') {
          //                           int idx = data.indexOf(element);
          //                           data[idx] = _SuratData(
          //                               'Keterangan Domisili',
          //                               double.parse(dropdownValue) - 1500,
          //                               Color.fromRGBO(0, 58, 126, 1));
          //                           // print(element.);
          //                         }
          //                       });
          //                     });
          //                   },
          //                   items:
          //                       list.map<DropdownMenuItem<String>>((String value) {
          //                     return DropdownMenuItem<String>(
          //                       value: value,
          //                       child: Text(value, textAlign: TextAlign.center),
          //                     );
          //                   }).toList(),
          //                 ),
          //               ),
          //             ),
          //           ),

          ),
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
}

Future getdata(String tahun, String jenis) async {
  var url = Uri.parse(env.host + '/petugasapi/homeapi/permohonan');
  // var url = Uri.parse(env.host + '/track?nomor_ajuan=20220909-0001');
  // var url = Uri.parse('https://devel.bebasbayar.com/web/test_programmer.php');
  // var url = Uri.parse(env.host + '/track?' + metode + '=' + data);
  // print(url);
  var response = await http.post(
    url,
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: jsonEncode(<String, String>{
      'tahun': tahun,
      'jenissurat': jenis,
    }),
  );
  var body = jsonDecode(response.body);
  // print(body['data'].toString());
  print(response.statusCode.toString());
  // return jsonDecode(response.body);
  Map<String, dynamic> userMap = jsonDecode(response.body);
  var dta = json.decode(response.body);
  userMap['statuscode'] = response.statusCode;
  // userMap['length'] = dta.length;
  // if (response.statusCode == 200) {
  return userMap;
  // }
  // print(userMap['length']);
  // return userMap;
}

List<String> list = <String>['2024', '2023', '2022', '2021', '2020'];
List<String> jenissuratlist = <String>[
  'Semua',
  'Keterangan Domisili',
  'Keterangan Tidak Mampu Sekolah',
  'Keterangan Ijin Usaha',
  'Keterangan Domisili Usaha',
  'Keterangan Pernyataan Para Tetangga',
  'Keterangan Usaha Dari Desa',
  'Keterangan Permohonan IUMK',
  'Keterangan Kelahiran',
  'Keterangan Benar Kelahiran',
  'Keterangan LN Panduan',
  'Keterangan Suami Istri',
  'Keterangan Data Benar',
  'Keterangan Kematian Di Rumah',
];
