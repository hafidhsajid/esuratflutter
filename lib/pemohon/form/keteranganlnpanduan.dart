import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';

class keteranganlnpanduan extends StatefulWidget {
  const keteranganlnpanduan({Key? key}) : super(key: key);

  @override
  State<keteranganlnpanduan> createState() => _keteranganlnpanduanState();
}

// TextEditingController TanggalLahir = TextEditingController();

class _keteranganlnpanduanState extends State<keteranganlnpanduan> {
  TextEditingController NIK = TextEditingController();
  TextEditingController NAMA = TextEditingController();
  TextEditingController TEMPAT_LAHIR = TextEditingController();
  TextEditingController TGL_LAHIR = TextEditingController();
  TextEditingController JK = TextEditingController();
  TextEditingController AGAMA = TextEditingController();
  TextEditingController ALAMAT = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController NAMA_IBU = TextEditingController();
  TextEditingController TEMPAT_LAHIR_IBU = TextEditingController();
  TextEditingController TGL_LAHIR_IBU = TextEditingController();
  TextEditingController JK_IBU = TextEditingController();
  TextEditingController AGAMA_IBU = TextEditingController();
  TextEditingController ALAMAT_IBU = TextEditingController();
  TextEditingController NAMA_ANAK = TextEditingController();
  TextEditingController TEMPAT_LAHIR_ANAK = TextEditingController();
  TextEditingController TGL_LAHIR_ANAK = TextEditingController();
  TextEditingController JK_ANAK = TextEditingController();
  TextEditingController AGAMA_ANAK = TextEditingController();
  TextEditingController ALAMAT_ANAK = TextEditingController();

  var jeniskelaminValue = jeniskelaminlist.first;
  var jeniskelaminanakValue = jeniskelaminlist.first;
  var jeniskelaminibuValue = jeniskelaminlist.first;
  var agamaValue = agamalist.first;
  var agamaanakValue = agamalist.first;
  var agamaibuValue = agamalist.first;
  var rtValue = rtlist.first;
  var rwValue = rwlist.first;
  var dusunValue = dusunlist.first;
  var rtanakValue = rtlist.first;
  var rwanakValue = rwlist.first;
  var dusunanakValue = dusunlist.first;
  var rtibuValue = rtlist.first;
  var rwibuValue = rwlist.first;
  var dusunibuValue = dusunlist.first;
  final _formKey = GlobalKey<FormState>();
  void validate() {
    var alamat = ALAMAT.text;
    alamat += ', Kec. Tumpang';
    alamat += dusunValue != dusunlist.first ? ', Dusun $dusunValue' : '';
    alamat += rtValue != rtlist.first ? ', RT $rtValue' : '';
    alamat += rwValue != rwlist.first ? ', RW $rwValue' : '';
    var alamatanak = ALAMAT.text;
    alamatanak += ', Kec. Tumpang';
    alamatanak +=
        dusunanakValue != dusunlist.first ? ', Dusun $dusunanakValue' : '';
    alamatanak += rtanakValue != rtlist.first ? ', RT $rtanakValue' : '';
    alamatanak += rwanakValue != rwlist.first ? ', RW $rwanakValue' : '';
    var alamatibu = ALAMAT.text;
    alamatibu += ', Kec. Tumpang';
    alamatibu +=
        dusunibuValue != dusunlist.first ? ', Dusun $dusunibuValue' : '';
    alamatibu += rtibuValue != rtlist.first ? ', RT $rtibuValue' : '';
    alamatibu += rwibuValue != rwlist.first ? ', RW $rwibuValue' : '';

    var body = jsonEncode(<String, String>{
      'JENIS_SURAT': '25',
      'NIK': NIK.text,
      'NAMA': NAMA.text,
      'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
      'TGL_LAHIR': TGL_LAHIR.text,
      'JK': jeniskelaminValue,
      'AGAMA': agamaValue,
      'ALAMAT': alamat,
      'EMAIL': EMAIL.text,
      'NAMA_IBU': NAMA_IBU.text,
      'TEMPAT_LAHIR_IBU': TEMPAT_LAHIR_IBU.text,
      'TGL_LAHIR_IBU': TGL_LAHIR_IBU.text,
      'JK_IBU': jeniskelaminibuValue,
      'AGAMA_IBU': agamaibuValue,
      'ALAMAT_IBU': alamatibu,
      'NAMA_ANAK': NAMA_ANAK.text,
      'TEMPAT_LAHIR_ANAK': TEMPAT_LAHIR_ANAK.text,
      'TGL_LAHIR_ANAK': TGL_LAHIR_ANAK.text,
      'JK_ANAK': jeniskelaminanakValue,
      'AGAMA_ANAK': agamaanakValue,
      'ALAMAT_ANAK': alamatanak,
    });
    print(body);
    final form = _formKey.currentState?.validate();
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
      sendpermohonan();
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
                    child: Text('Data Wali Ibu ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  // textinput('NIK*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'NIK'),
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
                      onChanged: (value) {
                        if (value.length == 16) {
                          getnik(NIK.text);
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: NIK,
                    ),
                  ),
                  // textinput('Nama*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Nama'),
                      controller: NAMA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Tempat Lahir*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tempat Lahir'),
                      controller: TEMPAT_LAHIR,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Tanggal Lahir*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tanggal Lahir'),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          String formattedDate =
                              // DateFormat('yyyy-MM-dd').format(pickedDate);
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          setState(() {
                            TGL_LAHIR.text = formattedDate;
                          });
                        } else {}
                      },
                      readOnly: true,
                      controller: TGL_LAHIR,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // jeniskelamin(),
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
                          onChanged: (String? valuejeniskelamin) {
                            setState(() {
                              jeniskelaminValue = valuejeniskelamin!;
                            });
                          },
                          value: jeniskelaminValue.isEmpty
                              ? jeniskelaminlist.first
                              : jeniskelaminValue,
                          items: jeniskelaminlist.map<DropdownMenuItem<String>>(
                              (String valuejeniskelamin) {
                            return DropdownMenuItem<String>(
                              value: valuejeniskelamin,
                              child: Text(valuejeniskelamin,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // agama(),
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
                          onChanged: (String? valueagama) {
                            setState(() {
                              agamaValue = valueagama!;
                            });
                          },
                          value:
                              agamaValue.isEmpty ? agamalist.first : agamaValue,
                          items: agamalist.map<DropdownMenuItem<String>>(
                              (String valueagama) {
                            return DropdownMenuItem<String>(
                              value: valueagama,
                              child:
                                  Text(valueagama, textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // textinput('Email*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Email'),
                      controller: EMAIL,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Alamat*'),

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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Alamat'),
                      controller: ALAMAT,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Ibu ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  // textinput('Nama*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Nama'),
                      controller: NAMA_IBU,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Tempat Lahir*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tempat Lahir'),
                      controller: TEMPAT_LAHIR_IBU,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Tanggal Lahir*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tanggal Lahir'),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          String formattedDate =
                              // DateFormat('yyyy-MM-dd').format(pickedDate);
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          setState(() {
                            TGL_LAHIR_IBU.text = formattedDate;
                          });
                        } else {}
                      },
                      controller: TGL_LAHIR_IBU,
                      readOnly: true,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Jenis Kelamin*'),
                  // textinput('Pilih'),
                  // jeniskelamin(),
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
                          onChanged: (String? valuejeniskelamin) {
                            setState(() {
                              jeniskelaminibuValue = valuejeniskelamin!;
                            });
                          },
                          value: jeniskelaminibuValue.isEmpty
                              ? jeniskelaminlist.first
                              : jeniskelaminibuValue,
                          items: jeniskelaminlist.map<DropdownMenuItem<String>>(
                              (String valuejeniskelamin) {
                            return DropdownMenuItem<String>(
                              value: valuejeniskelamin,
                              child: Text(valuejeniskelamin,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // textinput('Agama*'),
                  // textinput('Pilih'),
                  // agama(),
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
                          onChanged: (String? valueagama) {
                            setState(() {
                              agamaibuValue = valueagama!;
                            });
                          },
                          value: agamaibuValue.isEmpty
                              ? agamalist.first
                              : agamaibuValue,
                          items: agamalist.map<DropdownMenuItem<String>>(
                              (String valueagama) {
                            return DropdownMenuItem<String>(
                              value: valueagama,
                              child:
                                  Text(valueagama, textAlign: TextAlign.center),
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
                          validator: (value) => value == rtlist.first
                              ? 'Tidak boleh kosong'
                              : null,
                          onChanged: (String? valuert) {
                            setState(() {
                              rtibuValue = valuert!;
                            });
                          },
                          value: rtibuValue.isEmpty ? rtlist.first : rtibuValue,
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
                              rwibuValue = valuerw!;
                            });
                          },
                          value: rwibuValue.isEmpty ? rwlist.first : rwibuValue,
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
                              dusunibuValue = valuedusun!;
                            });
                          },
                          value: dusunibuValue.isEmpty
                              ? dusunlist.first
                              : dusunValue,
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
                  // textinput('Alamat*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Alamat'),
                      controller: ALAMAT_IBU,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Anak',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  // textinput('Nama*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Nama'),
                      controller: NAMA_ANAK,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Tempat Lahir*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tempat Lahir'),
                      controller: TEMPAT_LAHIR_ANAK,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Tanggal Lahir*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tanggal Lahir'),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          String formattedDate =
                              // DateFormat('yyyy-MM-dd').format(pickedDate);
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          setState(() {
                            TGL_LAHIR_ANAK.text = formattedDate;
                          });
                        } else {}
                      },
                      controller: TGL_LAHIR_ANAK,
                      readOnly: true,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Jenis Kelamin*'),
                  // textinput('Pilih'),
                  // jeniskelamin(),
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
                          onChanged: (String? valuejeniskelamin) {
                            setState(() {
                              jeniskelaminanakValue = valuejeniskelamin!;
                            });
                          },
                          value: jeniskelaminanakValue.isEmpty
                              ? jeniskelaminlist.first
                              : jeniskelaminanakValue,
                          items: jeniskelaminlist.map<DropdownMenuItem<String>>(
                              (String valuejeniskelamin) {
                            return DropdownMenuItem<String>(
                              value: valuejeniskelamin,
                              child: Text(valuejeniskelamin,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // textinput('Agama*'),
                  // textinput('Pilih'),
                  // agama(),
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
                          onChanged: (String? valueagama) {
                            setState(() {
                              agamaanakValue = valueagama!;
                            });
                          },
                          value: agamaanakValue.isEmpty
                              ? agamalist.first
                              : agamaanakValue,
                          items: agamalist.map<DropdownMenuItem<String>>(
                              (String valueagama) {
                            return DropdownMenuItem<String>(
                              value: valueagama,
                              child:
                                  Text(valueagama, textAlign: TextAlign.center),
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
                          validator: (value) => value == rtlist.first
                              ? 'Tidak boleh kosong'
                              : null,
                          onChanged: (String? valuert) {
                            setState(() {
                              rtanakValue = valuert!;
                            });
                          },
                          value:
                              rtanakValue.isEmpty ? rtlist.first : rtanakValue,
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
                              rwanakValue = valuerw!;
                            });
                          },
                          value:
                              rwanakValue.isEmpty ? rwlist.first : rwanakValue,
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
                              dusunanakValue = valuedusun!;
                            });
                          },
                          value: dusunanakValue.isEmpty
                              ? dusunlist.first
                              : dusunanakValue,
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
                  // textinput('Alamat*'),
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Alamat'),
                      controller: ALAMAT_ANAK,
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
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30.0),
          //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
          // ),
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
        // PEKERJAAN.text = found['pekerjaan'].toString();
        // statuskawinlist.forEach((element) {
        //   element.toLowerCase() ==
        //           found['status_kawin'].toString().toLowerCase()
        //       ? statuskawinValue = element
        //       : '';
        // });
      });
    }
  }

  nikError({String? message}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Alert"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message ?? 'NIK tidak ditemukan harap hubungi admin.'),
                  // Text('NIK tidak ditemukan harap hubungi admin.'),
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
    if (await ceknik(NIK.text) == false) {
      return nikError();
    } else {
      var alamat = ALAMAT.text;
      alamat += ', Kec. Tumpang';
      alamat += dusunValue != dusunlist.first ? ', Dusun $dusunValue' : '';
      alamat += rtValue != rtlist.first ? ', RT $rtValue' : '';
      alamat += rwValue != rwlist.first ? ', RW $rwValue' : '';
      var alamatanak = ALAMAT.text;
      alamatanak += ', Kec. Tumpang';
      alamatanak +=
          dusunanakValue != dusunlist.first ? ', Dusun $dusunanakValue' : '';
      alamatanak += rtanakValue != rtlist.first ? ', RT $rtanakValue' : '';
      alamatanak += rwanakValue != rwlist.first ? ', RW $rwanakValue' : '';
      var alamatibu = ALAMAT.text;
      alamatibu += ', Kec. Tumpang';
      alamatibu +=
          dusunibuValue != dusunlist.first ? ', Dusun $dusunibuValue' : '';
      alamatibu += rtibuValue != rtlist.first ? ', RT $rtibuValue' : '';
      alamatibu += rwibuValue != rwlist.first ? ', RW $rwibuValue' : '';

      var url = Uri.parse(env.host + '/layananapi/jns25');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'JENIS_SURAT': '25',
          'NIK': NIK.text,
          'NAMA': NAMA.text,
          'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
          'TGL_LAHIR': TGL_LAHIR.text,
          'JK': jeniskelaminValue,
          'AGAMA': agamaValue,
          'ALAMAT': alamat,
          'EMAIL': EMAIL.text,
          'NAMA_IBU': NAMA_IBU.text,
          'TEMPAT_LAHIR_IBU': TEMPAT_LAHIR_IBU.text,
          'TGL_LAHIR_IBU': TGL_LAHIR_IBU.text,
          'JK_IBU': jeniskelaminibuValue,
          'AGAMA_IBU': agamaibuValue,
          'ALAMAT_IBU': alamatibu,
          'NAMA_ANAK': NAMA_ANAK.text,
          'TEMPAT_LAHIR_ANAK': TEMPAT_LAHIR_ANAK.text,
          'TGL_LAHIR_ANAK': TGL_LAHIR_ANAK.text,
          'JK_ANAK': jeniskelaminanakValue,
          'AGAMA_ANAK': agamaanakValue,
          'ALAMAT_ANAK': alamatanak,
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
      // return jsonDecode(response.body);
    }
  }
}

// var jeniskelaminValue = jeniskelaminlist.first;
// var agamaValue = agamalist.first;

// List<String> jeniskelaminlist = <String>[
//   'Jenis Kelamin',
//   'Laki-Laki',
//   'Perempuan'
// ];
// List<String> agamalist = <String>[
//   'Agama',
//   'Islam',
//   'Kristen',
//   'Katholik',
//   'Budha',
//   'Hindu',
// ];
