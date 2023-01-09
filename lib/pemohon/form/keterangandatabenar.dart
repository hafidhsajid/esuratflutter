import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';

class keterangandatabenar extends StatefulWidget {
  const keterangandatabenar({Key? key}) : super(key: key);

  @override
  State<keterangandatabenar> createState() => _keterangandatabenarState();
}

// TextEditingController TanggalLahir = TextEditingController();

class _keterangandatabenarState extends State<keterangandatabenar> {
  TextEditingController NIK = TextEditingController();
  TextEditingController NAMA = TextEditingController();
  TextEditingController TEMPAT_LAHIR = TextEditingController();
  TextEditingController TGL_LAHIR = TextEditingController();
  TextEditingController JK = TextEditingController();
  TextEditingController PEKERJAAN = TextEditingController();
  TextEditingController ALAMAT = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController NAMA_USAHA = TextEditingController();
  TextEditingController JENIS_USAHA = TextEditingController();
  TextEditingController ALAMAT_USAHA = TextEditingController();
  TextEditingController STATUS_TEMPAT_USAHA = TextEditingController();
  TextEditingController PENANGGUNG_JAWAB_USAHA = TextEditingController();

  var rtValue = rtlist.first;
  var rwValue = rwlist.first;
  var dusunValue = dusunlist.first;
  var rtusahaValue = rtlist.first;
  var rwusahaValue = rwlist.first;
  var dusunusahaValue = dusunlist.first;

  var jeniskelaminValue = jeniskelaminlist.first;
  // var agamaValue = agamalist.first;

  final _formKey = GlobalKey<FormState>();
  void validate() {
    final form = _formKey.currentState?.validate();

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
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Diri',
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
                  // textinput('Nama'),
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
                        labelText: 'Nama',
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
                              // DateFormat('yyyy-MM-dd').format(pickedDate);
                              DateFormat('dd-MM-yyyy').format(pickedDate);
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
                  // textinput('Jenis Kelamin'),
                  // textinput('Pilih'),
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
                    child: Text('Data Usaha',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  // textinput('Nama Usaha'),
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
                        labelText: 'Nama Usaha',
                      ),
                      controller: NAMA_USAHA,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                    ),
                  ),
                  // textinput('Jenis Usaha'),
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
                  // textinput('Penanggung Jawab Usaha'),
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
                  // textinput('Status Tempat Usaha'),
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
                        labelText: 'Status Tempat Usaha',
                      ),
                      controller: STATUS_TEMPAT_USAHA,
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
                  // textinput('Alamat Usaha'),
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
                        labelText: 'Alamat Usaha',
                      ),
                      controller: ALAMAT_USAHA,
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
        // print(found.toString());
        NAMA.text = found['nama'].toString();
        jeniskelaminlist.forEach((element) {
          element.toLowerCase() == found['jk'].toString().toLowerCase()
              ? jeniskelaminValue = element
              : '';
        });
        TGL_LAHIR.text = found['tgl_lahir'].toString();
        TEMPAT_LAHIR.text = found['tempat_lahir'].toString();
        PEKERJAAN.text = found['pekerjaan'].toString();
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

      var alamatusaha = ALAMAT_USAHA.text;
      alamatusaha += ', Kec. Tumpang';
      alamatusaha +=
          dusunusahaValue != dusunlist.first ? ', Dusun $dusunusahaValue' : '';
      alamatusaha += rtusahaValue != rtlist.first ? ', RT $rtusahaValue' : '';
      alamatusaha += rwusahaValue != rwlist.first ? ', RW $rwusahaValue' : '';
      var url = Uri.parse(env.host + '/layananapi/jns27');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'JENIS_SURAT': '27',
          'NIK': NIK.text,
          'NAMA': NAMA.text,
          'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
          'TGL_LAHIR': TGL_LAHIR.text,
          'JK': jeniskelaminValue,
          'PEKERJAAN': PEKERJAAN.text,
          'ALAMAT': alamat,
          'EMAIL': EMAIL.text,
          'NAMA_USAHA': NAMA_USAHA.text,
          'JENIS_USAHA': JENIS_USAHA.text,
          'ALAMAT_USAHA': alamatusaha,
          'STATUS_TEMPAT_USAHA': STATUS_TEMPAT_USAHA.text,
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
      // return jsonDecode(response.body);
    }
  }
}
