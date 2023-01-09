import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/form/keteranganbenarkelahiran.dart';
import 'package:simriwinkapp/pemohon/form/keterangandatabenar.dart';
import 'package:simriwinkapp/pemohon/form/keterangandomisilicontainer.dart';
import 'package:simriwinkapp/pemohon/form/keterangandomisiliusaha.dart';
import 'package:simriwinkapp/pemohon/form/keteranganijinusaha.dart';
import 'package:simriwinkapp/pemohon/form/keterangankelahiran.dart';
import 'package:simriwinkapp/pemohon/form/keterangankematiandirumah.dart';
import 'package:simriwinkapp/pemohon/form/keteranganlnpanduan.dart';
import 'package:simriwinkapp/pemohon/form/keteranganpermohonaniumk.dart';
import 'package:simriwinkapp/pemohon/form/keteranganpernyataantetangga.dart';
import 'package:simriwinkapp/pemohon/form/keterangansuamiistri.dart';
import 'package:simriwinkapp/pemohon/form/keterangantidakmampusekolah.dart';
import 'package:simriwinkapp/pemohon/form/keteranganusahadaridesa.dart';

class formpengajuan extends StatefulWidget {
  const formpengajuan({Key? key}) : super(key: key);

  @override
  State<formpengajuan> createState() => _formpengajuanState();
}

String dropdownValue = list.first;

class _formpengajuanState extends State<formpengajuan> {
  @override
  Widget build(BuildContext context) {
    formtidakvalid() {}
    ;
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
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          dropdownjenis(),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text('Form Pengajuan',
          //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          // ),

          if (dropdownValue == "Keterangan Domisili")
            keterangandomisilicontainer(),

          if (dropdownValue == "Keterangan Tidak Mampu Sekolah")
            keterangantidakmampusekolah(),

          if (dropdownValue == "Keterangan Ijin Usaha") keteranganijinusaha(),
          // keterangantidakmampusekolahcontainer(),
          if (dropdownValue == "Keterangan Domisili Usaha")
            keterangandomisiliusaha(),
          if (dropdownValue == "Keterangan Pernyataan Para Tetangga")
            keteranganpernyataantetangga(),

          if (dropdownValue == "Keterangan Usaha Dari Desa")
            keteranganusahadaridesa(),
          if (dropdownValue == "Keterangan Permohonan IUMK")
            keteranganpermohonaniumk(),
          if (dropdownValue == "Keterangan Kelahiran") keterangankelahiran(),
          if (dropdownValue == "Keterangan Benar Kelahiran")
            keteranganbenarkelahiran(),
          if (dropdownValue == "Keterangan LN Panduan") keteranganlnpanduan(),
          if (dropdownValue == "Keterangan Suami Istri") keterangansuamiistri(),
          if (dropdownValue == "Keterangan Data Benar") keterangandatabenar(),
          if (dropdownValue == "Keterangan Kematian Di Rumah")
            keterangankematiandirumah(),
        ],
      )),
    );
  }

  dropdownjenis() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
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
                dropdownValue = value!;
                if (dropdownValue == "Keterangan Domisili") {}
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
    );
  }
}

// Future ceknik(String nik) async {
//   bool found = false;
//   // var url = Uri.parse('http://desawr9.id' + '/layanan/cek_nik/' + nik);
//   var url = Uri.parse(env.host + '/layanan/cek_nik/' + nik);
//   var response = await http.get(
//     url,
//   );
//   try {
//     var body = jsonDecode(response.body);
//     if (body['nama'] != null) {
//       found = true;
//     }

//     print(body['nama']);
//   } catch (e) {
//     print("error");
//     found = false;
//     return false;
//   }
//   // print(url);
//   return found;
// }

List<String> list = <String>[
  'Pilih',
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

List<String> rtlist = <String>[
  'RT',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',
  '32',
  '33',
  '34',
  '35',
];
List<String> rwlist = <String>[
  'RW',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
];
List<String> dusunlist = <String>['Dusun', 'Sumberingin', 'Nongkosongo'];

List<String> warganegaralist = <String>[
  'Warganegara',
  'Warga Negara Indonesia',
  'Warga Negara Asing',
];

List<String> agamalist = <String>[
  'Agama',
  'Islam',
  'Kristen',
  'Katholik',
  'Budha',
  'Hindu',
];

List<String> statuskawinlist = <String>[
  'Status Kawin',
  'Belum Kawin',
  'Kawin',
  'Cerai Hidup',
  'Cerai Mati'
];

List<String> jeniskelaminlist = <String>[
  'Jenis Kelamin',
  'Laki-Laki',
  'Perempuan'
];

Future ceknik(String nik) async {
  bool found = false;
  // var url = Uri.parse('http://desawr9.id' + '/layanan/cek_nik/' + nik);
  var url = Uri.parse(env.host + '/layanan/cek_nik/' + nik);
  var response = await http.get(
    url,
  );
  try {
    var body = jsonDecode(response.body);
    if (body['nama'] != null) {
      found = true;
    }

    print(body['nama']);
  } catch (e) {
    print("error");
    found = false;
    return false;
  }
  // print(url);
  return found;
}
