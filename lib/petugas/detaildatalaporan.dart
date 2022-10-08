import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simriwinkapp/main.dart';
import 'package:http/http.dart' as http;

class detaildatalaporan extends StatelessWidget {
  final String awal;
  final String akhir;
  const detaildatalaporan({required this.awal, required this.akhir, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SafeArea(
            child: SingleChildScrollView(
          child: FutureBuilder(
              future: getdata(awal, akhir),
              builder: (context, AsyncSnapshot snapshot) {
                // print(snapshot.data.toString());
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data['data'][index]['JENIS_SURAT']
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text('Jumlah: '),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.data['data'][index]['jml']
                                          .toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                // Text(snapshot.data['data'][index]
                                //     .toString()),
                              ],
                            )),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
                // }));
              }),
        )));
  }
}

Future getdata(String tglawal, String tglakhir) async {
  var url = Uri.parse(env.host + '/petugasapi/homeapi/laporan');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: jsonEncode(<String, String>{
      'tglawal': tglawal,
      'tglakhir': tglakhir,
    }),
  );

  var body = jsonDecode(response.body);
  Map<String, dynamic> userMap = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return userMap;
  }
}

Future accdata() async {
  var url = Uri.parse(env.host + '/petugasapi/homeapi/laporan');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: jsonEncode(<String, String>{
      // 'tglawal': tglawal,
      // 'tglakhir': tglakhir,
      'id': '1',
      'status': '1',
    }),
  );

  var body = jsonDecode(response.body);
  Map<String, dynamic> userMap = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return userMap;
  }
}
