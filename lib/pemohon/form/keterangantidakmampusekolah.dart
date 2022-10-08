import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class keterangantidakmampusekolah extends StatefulWidget {
  const keterangantidakmampusekolah({Key? key}) : super(key: key);

  @override
  State<keterangantidakmampusekolah> createState() =>
      _keterangantidakmampusekolahState();
}

TextEditingController TanggalLahirOrangtua = TextEditingController();
TextEditingController TanggalLahirAnak = TextEditingController();

class _keterangantidakmampusekolahState
    extends State<keterangantidakmampusekolah> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Data Orang Tua ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        Form(
            child: Column(children: [
          // textinput('NIK'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'NIK',
              ),
            ),
          ),
          // textinput('Nama Lengkap'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Nama Lengkap',
              ),
            ),
          ),
          // textinput('Tempat Lahir'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Tempat Lahir',
              ),
            ),
          ),
          // textinput('Tanggal Lahir'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Tanggal Lahir',
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    TanggalLahirOrangtua.text = formattedDate;
                  });
                } else {}
              },
            ),
          ),
          // textinput('Jenis Kelamin'),
          jeniskelamin(),
          // textinput('Pekerjaan'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Pekerjaan',
              ),
            ),
          ),
          // textinput('Agama'),
          agama(),
          // textinput('Alamat'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Alamat',
              ),
            ),
          ),
          // textinput('Status Kawin'),
          statuskawin(),
          // textinput('Warganegara'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Warganegara',
              ),
            ),
          ),
          // textinput('Email'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Email',
              ),
            ),
          ),
          // textinput('No HP'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'No HP',
              ),
            ),
          ),
          // textinput('Keterangan'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Keterangan',
              ),
            ),
          ),
          // textinput('Alamat'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                // border: OutlinedBorder(side: ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                // ),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Alamat',
              ),
            ),
          ),
        ])),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Data Anak ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        // textinput('NIK'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              // border: OutlinedBorder(side: ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30.0),
              //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
              // ),
              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
              fillColor: Colors.white,
              filled: true,
              labelText: 'NIK',
            ),
          ),
        ),
        // textinput('Nama Lengkap'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              // border: OutlinedBorder(side: ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30.0),
              //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
              // ),
              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
              fillColor: Colors.white,
              filled: true,
              labelText: 'Nama Lengkap',
            ),
          ),
        ),
        // textinput('Tempat Lahir'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              // border: OutlinedBorder(side: ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30.0),
              //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
              // ),
              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
              fillColor: Colors.white,
              filled: true,
              labelText: 'Tempat Lahir',
            ),
          ),
        ),
        // textinput('Tanggal Lahir'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              // border: OutlinedBorder(side: ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30.0),
              //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
              // ),
              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
              fillColor: Colors.white,
              filled: true,
              labelText: 'Tanggal Lahir',
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  TanggalLahirAnak.text = formattedDate;
                });
              } else {}
            },
          ),
        ),
        // textinput('Jenis Kelamin'),
        jeniskelamin(),
        // textinput('Pekerjaan'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              // border: OutlinedBorder(side: ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30.0),
              //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
              // ),
              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
              fillColor: Colors.white,
              filled: true,
              labelText: 'Pekerjaan',
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(16.0),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => sentpage(),
              //     ));

              //validate();
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Submit',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Padding textinput(String nama) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
          fillColor: Colors.white,
          filled: true,
          labelText: nama,
        ),
      ),
    );
  }

  jeniskelamin() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: DropdownButton(
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            elevation: 16,
            underline: SizedBox(),
            onChanged: (String? valuejeniskelamin) {
              setState(() {
                jeniskelaminValue = valuejeniskelamin!;
              });
            },
            value: jeniskelaminValue.isEmpty
                ? jeniskelaminlist.first
                : jeniskelaminValue,
            items: jeniskelaminlist
                .map<DropdownMenuItem<String>>((String valuejeniskelamin) {
              return DropdownMenuItem<String>(
                value: valuejeniskelamin,
                child: Text(valuejeniskelamin, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  agama() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: DropdownButton(
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            elevation: 16,
            underline: SizedBox(),
            onChanged: (String? valueagama) {
              setState(() {
                agamaValue = valueagama!;
              });
            },
            value: agamaValue.isEmpty ? agamalist.first : agamaValue,
            items: agamalist.map<DropdownMenuItem<String>>((String valueagama) {
              return DropdownMenuItem<String>(
                value: valueagama,
                child: Text(valueagama, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  statuskawin() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: DropdownButton(
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            elevation: 16,
            underline: SizedBox(),
            onChanged: (String? valuestatuskawin) {
              setState(() {
                statuskawinValue = valuestatuskawin!;
              });
            },
            value: statuskawinValue.isEmpty
                ? statuskawinlist.first
                : statuskawinValue,
            items: statuskawinlist
                .map<DropdownMenuItem<String>>((String valuestatuskawin) {
              return DropdownMenuItem<String>(
                value: valuestatuskawin,
                child: Text(valuestatuskawin, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future sendpermohonan() async {
    var url = Uri.parse(env.host + '/layananapi/jns4');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      // body: jsonEncode(<String, String>{
      //   'NIK': NIK.text,
      //   'NAMA': Nama.text,
      //   'TEMPAT_LAHIR': TempatLahir.text,
      //   'TANGGAL_LAHIR': TanggalLahir.text,
      //   'JK': jeniskelaminValue,
      //   'JENIS_PEKERJAAN': Pekerjaan,
      //   'AGAMA': agamaValue,
      //   'KEWARGANEGARAAN': Warganegara.text,
      //   'ALAMAT': Alamat.text,
      //   'JENIS_SURAT': '4',
      //   'KETERANGAN': Keterangan.text,
      //   'STATUS_KAWIN': statuskawinValue,
      //   'NO_HP': NoHP.text,
      // }),
    );
    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => sentpage(
              body: response.body.toString(),
              nomor: body['kode_ajuan'].toString(),
              keterangan: body['keterangan'].toString(),
            ),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['message'].toString()),
        backgroundColor: Colors.red,
      ));
    }
    // print(url);
    // print(response.statusCode.toString());
    // print(response.body.toString());
    return jsonDecode(response.body);
  }
}

var jeniskelaminValue = jeniskelaminlist.first;
var agamaValue = agamalist.first;
var statuskawinValue = statuskawinlist.first;

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
List<String> agamalist = <String>[
  'Agama',
  'Islam',
  'Kristen',
  'Katholik',
  'Budha',
  'Hindu',
];
