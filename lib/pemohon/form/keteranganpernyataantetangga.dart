import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';

class keteranganpernyataantetangga extends StatefulWidget {
  const keteranganpernyataantetangga({Key? key}) : super(key: key);

  @override
  State<keteranganpernyataantetangga> createState() =>
      _keteranganpernyataantetanggaState();
}

TextEditingController TanggalLahir = TextEditingController();

class _keteranganpernyataantetanggaState
    extends State<keteranganpernyataantetangga> {
  TextEditingController JENIS_SURAT = TextEditingController();
  TextEditingController NIK = TextEditingController();
  TextEditingController NAMA = TextEditingController();
  TextEditingController TEMPAT_LAHIR = TextEditingController();
  TextEditingController TGL_LAHIR = TextEditingController();
  TextEditingController PEKERJAAN = TextEditingController();
  TextEditingController ALAMAT = TextEditingController();
  TextEditingController RT = TextEditingController();
  TextEditingController RW = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController LOKASI_USAHA = TextEditingController();
  TextEditingController RT_USAHA = TextEditingController();
  TextEditingController RW_USAHA = TextEditingController();
  TextEditingController DESA = TextEditingController();
  TextEditingController KECAMATAN = TextEditingController();
  TextEditingController KABUPATEN = TextEditingController();
  TextEditingController LUAS_TANAH = TextEditingController();
  TextEditingController LUAS_BANGUNAN = TextEditingController();
  TextEditingController FUNGSI = TextEditingController();
  TextEditingController STATUS_TANAH = TextEditingController();
  TextEditingController TETANGGA_KIRI = TextEditingController();
  TextEditingController LOKASI_1 = TextEditingController();
  TextEditingController RUMAH_1 = TextEditingController();
  TextEditingController TETANGGA_KANAN = TextEditingController();
  TextEditingController LOKASI_2 = TextEditingController();
  TextEditingController RUMAH_2 = TextEditingController();
  TextEditingController TETANGGA_DEPAN = TextEditingController();
  TextEditingController LOKASI_3 = TextEditingController();
  TextEditingController RUMAH_3 = TextEditingController();
  TextEditingController TETANGGA_BELAKANG = TextEditingController();
  TextEditingController LOKASI_4 = TextEditingController();
  TextEditingController RUMAH_4 = TextEditingController();
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
    var body = jsonEncode(<String, String>{
      'JENIS_SURAT': "20",
      'NIK': NIK.text,
      'NAMA': NAMA.text,
      'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
      'TGL_LAHIR': TGL_LAHIR.text,
      'PEKERJAAN': PEKERJAAN.text,
      'ALAMAT': alamat,
      'RT': rtValue,
      'RW': rwValue,
      'EMAIL': EMAIL.text,
      'LOKASI_USAHA': LOKASI_USAHA.text,
      'RT_USAHA': rtusahaValue,
      'RW_USAHA': rwusahaValue,
      'DESA': DESA.text,
      'KECAMATAN': KECAMATAN.text,
      'KABUPATEN': KABUPATEN.text,
      'LUAS_TANAH': LUAS_TANAH.text,
      'LUAS_BANGUNAN': LUAS_BANGUNAN.text,
      'FUNGSI': FUNGSI.text,
      'STATUS_TANAH': STATUS_TANAH.text,
      'TETANGGA_KIRI': TETANGGA_KIRI.text,
      'LOKASI_1': LOKASI_1.text,
      'RUMAH_1': RUMAH_1.text,
      'TETANGGA_KANAN': TETANGGA_KANAN.text,
      'LOKASI_2': LOKASI_2.text,
      'RUMAH_2': RUMAH_2.text,
      'TETANGGA_DEPAN': TETANGGA_DEPAN.text,
      'LOKASI_3': LOKASI_3.text,
      'RUMAH_3': RUMAH_3.text,
      'TETANGGA_BELAKANG': TETANGGA_BELAKANG.text,
      'LOKASI_4': LOKASI_4.text,
      'RUMAH_4': RUMAH_4.text,
    });
    print(body);

    if (form == false) {
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
      sendpermohonan();
    }
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Diri ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
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
                      controller: NAMA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
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
                      controller: TEMPAT_LAHIR,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
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
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                      controller: TGL_LAHIR,
                      readOnly: true,
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
                      controller: PEKERJAAN,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Agama'),
                  agama(),
                  // textinput('No. HP'),
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
                        labelText: 'No. HP',
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
                      controller: EMAIL,
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Alamat',
                      ),
                      controller: ALAMAT,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Usaha ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  // textinput('Lokasi Usaha'),

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
                        labelText: 'Lokasi Usaha',
                      ),
                      controller: LOKASI_USAHA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('RT'),
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
                              rtusahaValue = valuert!;
                            });
                          },
                          value: rtusahaValue.isEmpty
                              ? rtlist.first
                              : rtusahaValue,
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
                              rwusahaValue = valuerw!;
                            });
                          },
                          value: rwusahaValue.isEmpty
                              ? rwlist.first
                              : rwusahaValue,
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
                              dusunusahaValue = valuedusun!;
                            });
                          },
                          value: dusunusahaValue.isEmpty
                              ? dusunlist.first
                              : dusunusahaValue,
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
                  // textinput('Desa'),
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
                        labelText: 'Desa',
                      ),
                      controller: DESA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Kecamatan'),
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
                        labelText: 'Kecamatan',
                      ),
                      controller: KECAMATAN,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Kabupaten'),
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
                        labelText: 'Kabupaten',
                      ),
                      controller: KABUPATEN,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Luas Tanah'),
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
                        labelText: 'Luas Tanah',
                      ),
                      controller: LUAS_TANAH,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Luas Bangunan'),
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
                        labelText: 'Luas Bangunan',
                      ),
                      controller: LUAS_BANGUNAN,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Fungsi'),
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
                        labelText: 'Fungsi',
                      ),
                      controller: FUNGSI,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Status Tanah'),
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
                        labelText: 'Status Tanah',
                      ),
                      controller: STATUS_TANAH,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Tetangga ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  // textinput('Tetangga Kiri'),
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
                        labelText: 'Tetangga Kiri',
                      ),
                      controller: TETANGGA_KIRI,
                    ),
                  ),
                  // textinput('Lokasi'), //pilih
                  // lokasi()
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          elevation: 16,
                          underline: SizedBox(),
                          onChanged: (String? valuelokasi) {
                            setState(() {
                              LOKASI_1.text = valuelokasi!;
                              // LOKASI_1.text = valuelokasi!;
                            });
                          },
                          value: LOKASI_1.text.isEmpty
                              ? lokasilist.first
                              : LOKASI_1.text,
                          items: lokasilist.map<DropdownMenuItem<String>>(
                              (String valuelokasi) {
                            return DropdownMenuItem<String>(
                              value: valuelokasi,
                              child: Text(valuelokasi,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  // textinput('Rumah'),
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
                        labelText: 'Rumah',
                      ),
                      controller: RUMAH_1,
                    ),
                  ),
                  // textinput('Tetangga Kanan'),
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
                        labelText: 'Tetangga Kanan',
                      ),
                      controller: TETANGGA_KANAN,
                    ),
                  ),
                  // textinput('Lokasi'), //pilih
                  // lokasi(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          elevation: 16,
                          underline: SizedBox(),
                          onChanged: (String? valuelokasi) {
                            setState(() {
                              LOKASI_2.text = valuelokasi!;
                            });
                          },
                          value: LOKASI_2.text.isEmpty
                              ? lokasilist.first
                              : LOKASI_2.text,
                          items: lokasilist.map<DropdownMenuItem<String>>(
                              (String valuelokasi) {
                            return DropdownMenuItem<String>(
                              value: valuelokasi,
                              child: Text(valuelokasi,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // textinput('Rumah'),
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
                        labelText: 'Rumah',
                      ),
                      controller: RUMAH_2,
                    ),
                  ),
                  // textinput('Tetangga Depan'),
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
                        labelText: 'Tetangga Depan',
                      ),
                      controller: TETANGGA_DEPAN,
                    ),
                  ),
                  // textinput('Lokasi'), //pilih
                  // lokasi(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          elevation: 16,
                          underline: SizedBox(),
                          onChanged: (String? valuelokasi) {
                            setState(() {
                              LOKASI_3.text = valuelokasi!;
                            });
                          },
                          value: LOKASI_3.text.isEmpty
                              ? lokasilist.first
                              : LOKASI_3.text,
                          items: lokasilist.map<DropdownMenuItem<String>>(
                              (String valuelokasi) {
                            return DropdownMenuItem<String>(
                              value: valuelokasi,
                              child: Text(valuelokasi,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // textinput('Rumah'),
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
                        labelText: 'Rumah',
                      ),
                      controller: RUMAH_3,
                    ),
                  ),
                  // textinput('Tetangga Belakang'),
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
                        labelText: 'Tetangga Belakang',
                      ),
                      controller: TETANGGA_BELAKANG,
                    ),
                  ),
                  // textinput('Lokasi'), //pilih
                  // lokasi(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          elevation: 16,
                          underline: SizedBox(),
                          onChanged: (String? valuelokasi) {
                            setState(() {
                              LOKASI_4.text = valuelokasi!;
                            });
                          },
                          value: LOKASI_4.text.isEmpty
                              ? lokasilist.first
                              : LOKASI_4.text,
                          items: lokasilist.map<DropdownMenuItem<String>>(
                              (String valuelokasi) {
                            return DropdownMenuItem<String>(
                              value: valuelokasi,
                              child: Text(valuelokasi,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // textinput('Rumah'),
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
                        labelText: 'Rumah',
                      ),
                      controller: RUMAH_4,
                    ),
                  ),
                ])),
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

              validate();
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
          child: DropdownButtonFormField(
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            elevation: 16,
            // underline: SizedBox(),
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            validator: (value) =>
                value == jeniskelaminlist.first ? 'Tidak boleh kosong' : null,
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
          child: DropdownButtonFormField(
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            elevation: 16,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
            // underline: SizedBox(),
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
            validator: (value) =>
                value == agamalist.first ? 'Tidak boleh kosong' : null,
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
          child: DropdownButtonFormField(
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            elevation: 16,
            // underline: SizedBox(),
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            validator: (value) =>
                value == statuskawinlist.first ? 'Tidak boleh kosong' : null,
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

  lokasi() {
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
            onChanged: (String? valuelokasi) {
              setState(() {
                lokasiValue = valuelokasi!;
              });
            },
            value: lokasiValue.isEmpty ? lokasilist.first : lokasiValue,
            items:
                lokasilist.map<DropdownMenuItem<String>>((String valuelokasi) {
              return DropdownMenuItem<String>(
                value: valuelokasi,
                child: Text(valuelokasi, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future getnik(String nik) async {
    var found;
    // var url = Uri.parse('http://desawr9.id' + '/layanan/cek_nik/' + nik);
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
        KABUPATEN.text = "Malang";
        KECAMATAN.text = "Tumpang";

        statuskawinlist.forEach((element) {
          element.toLowerCase() ==
                  found['status_kawin'].toString().toLowerCase()
              ? statuskawinValue = element
              : '';
        });
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

    var url = Uri.parse(env.host + '/layananapi/jns20');

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
          'JENIS_SURAT': "20",
          'NIK': NIK.text,
          'NAMA': NAMA.text,
          'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
          'TGL_LAHIR': TGL_LAHIR.text,
          'PEKERJAAN': PEKERJAAN.text,
          'ALAMAT': alamat,
          'RT': rtValue,
          'RW': rwValue,
          'EMAIL': EMAIL.text,
          'LOKASI_USAHA': LOKASI_USAHA.text,
          'RT_USAHA': rtusahaValue,
          'RW_USAHA': rwusahaValue,
          'DESA': DESA.text,
          'KECAMATAN': KECAMATAN.text,
          'KABUPATEN': KABUPATEN.text,
          'LUAS_TANAH': LUAS_TANAH.text,
          'LUAS_BANGUNAN': LUAS_BANGUNAN.text,
          'FUNGSI': FUNGSI.text,
          'STATUS_TANAH': STATUS_TANAH.text,
          'TETANGGA_KIRI': TETANGGA_KIRI.text,
          'LOKASI_1': LOKASI_1.text,
          'RUMAH_1': RUMAH_1.text,
          'TETANGGA_KANAN': TETANGGA_KANAN.text,
          'LOKASI_2': LOKASI_2.text,
          'RUMAH_2': RUMAH_2.text,
          'TETANGGA_DEPAN': TETANGGA_DEPAN.text,
          'LOKASI_3': LOKASI_3.text,
          'RUMAH_3': RUMAH_3.text,
          'TETANGGA_BELAKANG': TETANGGA_BELAKANG.text,
          'LOKASI_4': LOKASI_4.text,
          'RUMAH_4': RUMAH_4.text,
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
      return jsonDecode(response.body);
    }
  }
}

var jeniskelaminValue = jeniskelaminlist.first;
var agamaValue = agamalist.first;
var statuskawinValue = statuskawinlist.first;
var lokasiValue = lokasilist.first;
List<String> lokasilist = <String>[
  'Lokasi',
  'Barat',
  'Timur',
  'Selatan',
  'Utara',
];
