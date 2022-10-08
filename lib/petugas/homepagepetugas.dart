import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/petugas/datalaporan.dart';
import 'package:simriwinkapp/petugas/datapermohonan.dart';
import 'package:simriwinkapp/petugas/login.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class homepagepetugas extends StatefulWidget {
  const homepagepetugas({Key? key}) : super(key: key);

  @override
  State<homepagepetugas> createState() => _homepagepetugasState();
}

List<String> list = <String>['2024', '2023', '2022', '2021', '2020'];

List<_SuratData> data = [
  _SuratData('Keterangan Beda Nama', 20, Color.fromRGBO(0, 58, 126, 1)),
  _SuratData(
      'Keterangan Belum Pernah Menikah', 20, Color.fromRGBO(0, 75, 163, 1)),
  _SuratData('Keterangan Boro Kerja', 20, Color.fromRGBO(3, 83, 177, 1)),
  _SuratData('Keterangan Domisili', 20, Color.fromRGBO(0, 97, 211, 1)),
  _SuratData('Keterangan Penghasilan', 20, Color.fromRGBO(0, 97, 211, 1)),
  _SuratData(
      'Keterangan Tidak Mampu Sekolah', 20, Color.fromRGBO(16, 126, 255, 1)),
  _SuratData('Ketereangan Ijin Usaha', 20, Color.fromRGBO(23, 130, 255, 1)),
  _SuratData('Pernyataan ( Masalah )', 20, Color.fromRGBO(39, 139, 255, 1)),
  _SuratData('Pernyataan Ijin Keramaian', 20, Color.fromRGBO(71, 156, 255, 1)),
  _SuratData(
      'Pernyataan Penambahan Anggota', 20, Color.fromRGBO(126, 186, 255, 1)),
  _SuratData('Pernyataan Salah Nama', 20, Color.fromRGBO(0, 58, 126, 1)),
  _SuratData('SKCK Baru', 20, Color.fromRGBO(0, 75, 163, 1)),
  _SuratData('Surat keterangan kehilangan', 20, Color.fromRGBO(3, 83, 177, 1)),
  _SuratData('Surat Pindah Tempat', 20, Color.fromRGBO(0, 58, 126, 1)),
];
List<_StatusSuratData> datastatus = [
  _StatusSuratData('Proses', 10, Color.fromRGBO(0, 58, 126, 1)),
  _StatusSuratData('Setujui', 5, Color.fromRGBO(3, 83, 177, 1)),
  _StatusSuratData('Selesai', 0, Color.fromRGBO(0, 97, 211, 1)),
  _StatusSuratData('Diambil', 0, Color.fromRGBO(0, 97, 211, 1)),
  _StatusSuratData('Ditolak', 0, Color.fromRGBO(23, 130, 255, 1)),
];

class _homepagepetugasState extends State<homepagepetugas> {
  int _currentIndex = 0;

  String dropdownValue = list.elementAt(2);

  @override
  Widget build(BuildContext context) {
    //final List<DeveloperSeries> data;
    final bool animate;

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
          child: FutureBuilder(
              future: getgrafik(dropdownValue),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                    // child: Text(),
                  );
                }
                return Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Home',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
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
                            });
                          },
                          items: list
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
                  SfCircularChart(
                      title: ChartTitle(
                          text: 'Grafik Permohonan (Jenis Surat)',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CircularSeries<_SuratData, String>>[
                        PieSeries<_SuratData, String>(
                            dataSource: data,
                            xValueMapper: (_SuratData surat, _) => surat.name,
                            yValueMapper: (_SuratData surat, _) => surat.y,
                            dataLabelMapper: (_SuratData surat, _) =>
                                surat.name + ":" + surat.y.toString(),
                            // name: '',
                            pointColorMapper: (_SuratData y, _) => y.color,
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(fontSize: 8),
                              // labelIntersectAction: LabelIntersectAction.shift,
                              overflowMode: OverflowMode.trim,
                              // labelIntersectAction: LabelIntersectAction.shift,
                              labelPosition: ChartDataLabelPosition.outside,
                            ))
                      ]),
                  SfCircularChart(
                      title: ChartTitle(
                          text: 'Grafik Permohonan (Status Surat)',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CircularSeries<_StatusSuratData, String>>[
                        PieSeries<_StatusSuratData, String>(
                            dataSource: datastatus,
                            xValueMapper: (_StatusSuratData status, _) =>
                                status.name,
                            yValueMapper: (_StatusSuratData status, _) =>
                                status.y,
                            dataLabelMapper: (_StatusSuratData status, _) =>
                                status.name + ":" + status.y.toString(),
                            // name: 'Sales',
                            pointColorMapper: (_StatusSuratData y, _) =>
                                y.color,
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(fontSize: 8),
                              // labelIntersectAction: LabelIntersectAction.shift,
                              // overflowMode: OverflowMode.trim,
                              labelIntersectAction: LabelIntersectAction.shift,
                              labelPosition: ChartDataLabelPosition.outside,
                            ))
                      ]),
                ]);
              }),
        ),
      ),
    );
  }

  Future getgrafik(String tahun) async {
    // var url = Uri.parse(env.host + '/track?NIK=3507161706860004');
    // var url = Uri.parse(env.host + '/track?nomor_ajuan=20220909-0001');
    var url = Uri.parse(env.host + '/petugasapi/homeapi/grafik');
    // var url = Uri.parse(env.host + '/track?' + metode + '=' + data);
    // var response = await http.get(url);
    var response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'tahun': tahun,
      }),
    );
    // print(url);
    // print(response.statusCode.toString());
    // print(response.body.toString());
    // print(jsonDecode(response.body));
    // return jsonDecode(response.body);

    Map<String, dynamic> userMap = jsonDecode(response.body);

    // userMap['statuscode'] = response.statusCode;
    if (response.statusCode == 200) {
      var data1 = userMap['data']['jenis'];
      var data2 = userMap['data']['status'];
      data1.forEach((x) => {
            data.forEach((element) {
              if (element.name == x['name']) {
                int idx = data.indexOf(element);
                data[idx] = _SuratData(
                    x['name'],
                    double.parse(x['y'].toString()),
                    // Color.fromRGBO(0, 58, 126, 1)
                    data[idx].color);
              }
            }),
          });
      data2.forEach((x) => {
            datastatus.forEach((element) {
              if (element.name == x['name']) {
                int idx = datastatus.indexOf(element);
                datastatus[idx] = _StatusSuratData(
                    x['name'],
                    double.parse(x['y'].toString()),
                    // Color.fromRGBO(0, 58, 126, 1)
                    datastatus[idx].color);
                // print(datastatus[idx].name.toString());
                // print(datastatus[idx].color.toString());
              }
            }),
          });
      // print(data.length);

      // return userMap;
      // data.forEach((element) {
      //                           // int index = list.indexOf('Keterangan Domisili');
      //                           if (element.name == 'Keterangan Domisili') {
      //                             int idx = data.indexOf(element);
      //                             data[idx] = _SuratData(
      //                                 'Keterangan Domisili',
      //                                 double.parse(dropdownValue) - 1500,
      //                                 Color.fromRGBO(0, 58, 126, 1));
      //                             // print(element.);
      //                           }
      //                         });
    }
    return userMap;
  }

  void logout() {
    Navigator.pop(context);
  }
}

class _SuratData {
  _SuratData(this.name, this.y, this.color);

  final String name;
  final double y;
  final Color color;
}

class _StatusSuratData {
  _StatusSuratData(this.name, this.y, this.color);

  final String name;
  final double y;
  final Color color;
}
