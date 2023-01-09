import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';

class keteranganusahadaridesa extends StatefulWidget {
  const keteranganusahadaridesa({Key? key}) : super(key: key);

  @override
  State<keteranganusahadaridesa> createState() =>
      _keteranganusahadaridesaState();
}

TextEditingController TanggalLahir = TextEditingController();

class _keteranganusahadaridesaState extends State<keteranganusahadaridesa> {
  TextEditingController NIK = TextEditingController();
  TextEditingController NAMA = TextEditingController();
  TextEditingController TEMPAT_LAHIR = TextEditingController();
  TextEditingController TGL_LAHIR = TextEditingController();
  TextEditingController JK = TextEditingController();
  TextEditingController PEKERJAAN = TextEditingController();
  TextEditingController ALAMAT = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController AGAMA = TextEditingController();
  TextEditingController NO_HP = TextEditingController();
  TextEditingController NAMA_USAHA = TextEditingController();
  TextEditingController JENIS_USAHA = TextEditingController();
  TextEditingController ALAMAT_USAHA = TextEditingController();
  TextEditingController STATUS_BANGUNAN = TextEditingController();
  TextEditingController AKTA_PENDIRIAN = TextEditingController();
  TextEditingController JUMLAH_KARYAWAN = TextEditingController();
  TextEditingController PENANGGUNG_JAWAB_USAHA = TextEditingController();

  var jeniskelaminValue = jeniskelaminlist.first;
  var agamaValue = agamalist.first;
  var rtValue = rtlist.first;
  var rwValue = rwlist.first;
  var dusunValue = dusunlist.first;
  var rtusahaValue = rtlist.first;
  var rwusahaValue = rwlist.first;
  var dusunusahaValue = dusunlist.first;
  final _formKey = GlobalKey<FormState>();

  void validate() {
    final form = _formKey.currentState?.validate();
    var alamat = ALAMAT.text;
    alamat += ', Kec. Tumpang';
    alamat += dusunValue != dusunlist.first ? ', Dusun $dusunValue' : '';
    alamat += rtValue != rtlist.first ? ', RT $rtValue' : '';
    alamat += rwValue != rwlist.first ? ', RW $rwValue' : '';

    var alamatusaha = ALAMAT_USAHA.text;
    // alamatusaha += ', Kec. Tumpang';
    // alamatusaha +=
    //     dusunusahaValue != dusunlist.first ? ', Dusun $dusunusahaValue' : '';
    // alamatusaha += rtusahaValue != rtlist.first ? ', RT $rtusahaValue' : '';
    // alamatusaha += rwusahaValue != rwlist.first ? ', RW $rwusahaValue' : '';

    var body = jsonEncode(<String, String>{
      'JENIS_SURAT': "21",
      'NIK': NIK.text,
      'NAMA': NAMA.text,
      'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
      'TGL_LAHIR': TGL_LAHIR.text,
      'JK': JK.text,
      'PEKERJAAN': PEKERJAAN.text,
      'ALAMAT': alamat,
      'EMAIL': EMAIL.text,
      'AGAMA': AGAMA.text,
      'NO_HP': NO_HP.text,
      'NAMA_USAHA': NAMA_USAHA.text,
      'JENIS_USAHA': JENIS_USAHA.text,
      'ALAMAT_USAHA': alamatusaha,
      'STATUS_BANGUNAN': STATUS_BANGUNAN.text,
      'AKTA_PENDIRIAN': AKTA_PENDIRIAN.text,
      'JUMLAH_KARYAWAN': JUMLAH_KARYAWAN.text,
      'PENANGGUNG_JAWAB_USAHA': PENANGGUNG_JAWAB_USAHA.text,
    });
    print(body);

    if (form == false) {
      // print('Form is invalid');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Alert"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Form tidak valid silahkan diperbaiki.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      // _isloading = true;
      // ceklogin(context);

      sendpermohonan();
      // print('Form is valid');
    }
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Pemohon ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  //textinput('NIK'),
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
                      onChanged: (value) {
                        if (value.length == 16) {
                          getnik(NIK.text);
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.length != 16) {
                          return "NIK harus 16 digit";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: NIK,
                    ),
                  ),
                  //textinput('Nama Lengkap'),
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
                      controller: NAMA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Tempat Lahir'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Tempat Lahir',
                      ),
                      controller: TEMPAT_LAHIR,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Tanggal Lahir'),
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
                            TGL_LAHIR.text = formattedDate;
                          });
                        } else {}
                      },
                      controller: TGL_LAHIR,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // //textinput('Jenis Kelamin'),
                  jeniskelamin(),
                  //textinput('Pekerjaan'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Pekerjaan',
                      ),
                      controller: PEKERJAAN,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // //textinput('Agama'),
                  agama(),
                  //textinput('Email'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Email',
                      ),
                      controller: EMAIL,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('No HP'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'No HP',
                      ),
                      controller: NO_HP,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          elevation: 16,
                          // underline: SizedBox(),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) => value == rtlist.first
                              ? 'Tidak boleh kosong'
                              : null,
                          onChanged: (String? valuert) {
                            setState(() {
                              rtValue = valuert!;
                            });
                          },
                          value: rtValue.isEmpty ? rtlist.first : rtValue,
                          items: rtlist
                              .map<DropdownMenuItem<String>>((String valuert) {
                            return DropdownMenuItem<String>(
                              value: valuert,
                              child: Text(valuert, textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          elevation: 16,
                          // underline: SizedBox(),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) => value == rwlist.first
                              ? 'Tidak boleh kosong'
                              : null,
                          onChanged: (String? valuerw) {
                            setState(() {
                              rwValue = valuerw!;
                            });
                          },
                          value: rwValue.isEmpty ? rwlist.first : rwValue,
                          items: rwlist
                              .map<DropdownMenuItem<String>>((String valuerw) {
                            return DropdownMenuItem<String>(
                              value: valuerw,
                              child: Text(valuerw, textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          elevation: 16,
                          // underline: SizedBox(),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) => value == dusunlist.first
                              ? 'Tidak boleh kosong'
                              : null,
                          onChanged: (String? valuedusun) {
                            setState(() {
                              dusunValue = valuedusun!;
                            });
                          },
                          value:
                              dusunValue.isEmpty ? dusunlist.first : dusunValue,
                          items: dusunlist.map<DropdownMenuItem<String>>(
                              (String valuedusun) {
                            return DropdownMenuItem<String>(
                              value: valuedusun,
                              child:
                                  Text(valuedusun, textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  //textinput('Alamat'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Alamat',
                      ),
                      controller: ALAMAT,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Domisili Usaha ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  //textinput('Nama Usaha /  Perusahaan'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Nama Usaha /  Perusahaan',
                      ),
                      controller: NAMA_USAHA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Alamat Usaha /  Perusahaan'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Alamat Usaha /  Perusahaan',
                      ),
                      controller: ALAMAT_USAHA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Jenis Usaha'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Jenis Usaha',
                      ),
                      controller: JENIS_USAHA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Penanggung Jawab Usaha'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Penanggung Jawab Usaha',
                      ),
                      controller: PENANGGUNG_JAWAB_USAHA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Status Bangunan'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Status Bangunan',
                      ),
                      controller: STATUS_BANGUNAN,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Akter Pendirian'),
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
                        labelText: 'Akta Pendirian',
                      ),
                      controller: AKTA_PENDIRIAN,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  //textinput('Jumlah Karyawan'),
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Jumlah Karyawan',
                      ),
                      controller: JUMLAH_KARYAWAN,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(16.0),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          validate();
                        });
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
                ])));
  }

  Padding textinput(String nama) {
    return Padding(
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
                JK.text = valuejeniskelamin!;
              });
            },
            value: JK.text.isEmpty ? jeniskelaminlist.first : JK.text,
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
                AGAMA.text = valueagama!;
              });
            },
            value: AGAMA.text.isEmpty ? agamalist.first : AGAMA.text,
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

  Future getnik(String nik) async {
    var found;
    var url = Uri.parse(env.host + '/layanan/cek_nik/' + nik);
    try {
      var response = await http.get(
        url,
      );
      var body = jsonDecode(response.body);
      if (body['nama'] != null) {
        found = body;
      }
      // return found;
    } catch (e) {
      // print("error");
    }
    if (found != null) {
      setState(() {
        print(found.toString());
        NAMA.text = found['nama'].toString();
        jeniskelaminlist.forEach((element) {
          element.toLowerCase() == found['jk'].toString().toLowerCase()
              ? jeniskelaminValue = element
              : '';
        });
        TGL_LAHIR.text = found['tgl_lahir'].toString();
        TEMPAT_LAHIR.text = found['tempat_lahir'].toString();
        PEKERJAAN.text = found['pekerjaan'].toString();
        // statuskawinlist.forEach((element) {
        //   element.toLowerCase() ==
        //           found['status_kawin'].toString().toLowerCase()
        //       ? statuskawinValue = element
        //       : '';
        // });
      });
    }
  }

  nikError() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Alert"),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('NIK tidak ditemukan harap hubungi admin.'),
                  // Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future sendpermohonan() async {
    var alamat = ALAMAT.text;
    alamat += ', Kec. Tumpang';
    alamat += dusunValue != dusunlist.first ? ', Dusun $dusunValue' : '';
    alamat += rtValue != rtlist.first ? ', RT $rtValue' : '';
    alamat += rwValue != rwlist.first ? ', RW $rwValue' : '';

    var alamatusaha = ALAMAT_USAHA.text;
    var url = Uri.parse(env.host + '/layananapi/jns21');
    if (await ceknik(NIK.text) == false) {
      return nikError();
    } else {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'JENIS_SURAT': "21",
          'NIK': NIK.text,
          'NAMA': NAMA.text,
          'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
          'TGL_LAHIR': TGL_LAHIR.text,
          'JK': JK.text,
          'PEKERJAAN': PEKERJAAN.text,
          'ALAMAT': alamat,
          'EMAIL': EMAIL.text,
          'AGAMA': AGAMA.text,
          'NO_HP': NO_HP.text,
          'NAMA_USAHA': NAMA_USAHA.text,
          'JENIS_USAHA': JENIS_USAHA.text,
          'ALAMAT_USAHA': alamatusaha,
          'STATUS_BANGUNAN': STATUS_BANGUNAN.text,
          'AKTA_PENDIRIAN': AKTA_PENDIRIAN.text,
          'JUMLAH_KARYAWAN': JUMLAH_KARYAWAN.text,
          'PENANGGUNG_JAWAB_USAHA': PENANGGUNG_JAWAB_USAHA.text,
        }),
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
      // return jsonDecode(response.body);
    }
  }
}
