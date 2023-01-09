import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';

class keteranganijinusaha extends StatefulWidget {
  const keteranganijinusaha({Key? key}) : super(key: key);

  @override
  State<keteranganijinusaha> createState() => _keteranganijinusahaState();
}

class _keteranganijinusahaState extends State<keteranganijinusaha> {
  TextEditingController TanggalLahir = TextEditingController();
  TextEditingController NIK = TextEditingController();
  TextEditingController NAMA = TextEditingController();
  TextEditingController TEMPAT_LAHIR = TextEditingController();
  TextEditingController TGL_LAHIR = TextEditingController();
  TextEditingController JK = TextEditingController();
  TextEditingController PEKERJAAN = TextEditingController();
  TextEditingController AGAMA = TextEditingController();
  TextEditingController WARGANEGARA = TextEditingController();
  TextEditingController ALAMAT = TextEditingController();
  TextEditingController KETERANGAN = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController STATUS_KAWIN = TextEditingController();
  TextEditingController BIDANG_USAHA = TextEditingController();
  TextEditingController NO_HP = TextEditingController();

  var jeniskelaminValue = jeniskelaminlist.first;
  var agamaValue = agamalist.first;
  var warganegaraValue = warganegaralist.first;
  var statuskawinValue = statuskawinlist.first;
  var rtValue = rtlist.first;
  var rwValue = rwlist.first;
  var dusunValue = dusunlist.first;

  final _formKey = GlobalKey<FormState>();
  void validate() {
    var alamat = ALAMAT.text;
    alamat += ', Kec. Tumpang';
    alamat += dusunValue != dusunlist.first ? ', Dusun $dusunValue' : '';
    alamat += rtValue != rtlist.first ? ', RT $rtValue' : '';
    alamat += rwValue != rwlist.first ? ', RW $rwValue' : '';

    var body = jsonEncode(<String, String>{
      'JENIS_SURAT': "7",
      'NIK': NIK.text,
      'NAMA': NAMA.text,
      'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
      'TGL_LAHIR': TGL_LAHIR.text,
      'JK': JK.text,
      'PEKERJAAN': PEKERJAAN.text,
      'AGAMA': AGAMA.text,
      'WARGANEGARA': WARGANEGARA.text,
      'ALAMAT': alamat,
      'KETERANGAN': KETERANGAN.text,
      'EMAIL': EMAIL.text,
      'STATUS_KAWIN': STATUS_KAWIN.text,
      'BIDANG_USAHA': BIDANG_USAHA.text,
      'NO_HP': NO_HP.text,
    });
    print(body);
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

                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(30.0),
                        //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                        // ),
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'NIK',
                      ),
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
                      readOnly: true,
                      controller: TGL_LAHIR,
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
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
                  // textinput('Warganegara'),
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
                          validator: (value) => value == warganegaralist.first
                              ? 'Tidak boleh kosong'
                              : null,
                          onChanged: (String? valuewarganegara) {
                            setState(() {
                              warganegaraValue = valuewarganegara!;
                              WARGANEGARA.text = valuewarganegara!;
                              if (WARGANEGARA.text == "Warga Negara Asing") {
                                warganegaraValue = "";
                              }
                            });
                          },
                          value: WARGANEGARA.text.isEmpty
                              ? warganegaralist.first
                              : WARGANEGARA.text,
                          items: warganegaralist.map<DropdownMenuItem<String>>(
                              (String valuewarganegara) {
                            return DropdownMenuItem<String>(
                              value: valuewarganegara,
                              child: Text(valuewarganegara,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  if (WARGANEGARA.text == "Warga Negara Asing")
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
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Warganegara',
                        ),
                        // controller: WARGANEGARA,
                        onChanged: (value) {
                          warganegaraValue = value;
                        },
                        validator: (value) =>
                            value!.isEmpty ? "Tidak boleh kosong" : null,
                      ),
                    ),
                  // textinput('Status Kawin'),
                  statuskawin(),
                  // textinput('Bidan Usaha'),
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
                        labelText: 'Bidang Usaha',
                      ),
                      controller: BIDANG_USAHA,
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
                  // textinput('Alamat'),

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

                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(30.0),
                        //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                        // ),
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
                      controller: KETERANGAN,
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
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'No. HP',
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Tidak boleh kosong" : null,
                      controller: NO_HP,
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
        controller: NAMA,
        validator: (value) => value!.isEmpty ? "Tidak boleh kosong" : null,
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
                JK.text = valuejeniskelamin!;
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
            // underline: SizedBox(),
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            validator: (value) =>
                value == agamalist.first ? 'Tidak boleh kosong' : null,

            onChanged: (String? valueagama) {
              setState(() {
                agamaValue = valueagama!;
                AGAMA.text = valueagama!;
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
                STATUS_KAWIN.text = valuestatuskawin!;
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
        TanggalLahir.text = found['tgl_lahir'].toString();
        TEMPAT_LAHIR.text = found['tempat_lahir'].toString();
        PEKERJAAN.text = found['pekerjaan'].toString();
        statuskawinlist.forEach((element) {
          element.toLowerCase() ==
                  found['status_kawin'].toString().toLowerCase()
              ? statuskawinValue = element
              : '';
        });
      });
    }
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

      var url = Uri.parse(env.host + '/layananapi/jns7');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, String>{
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

          'JENIS_SURAT': "7",
          'NIK': NIK.text,
          'NAMA': NAMA.text,
          'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
          'TGL_LAHIR': TGL_LAHIR.text,
          'JK': JK.text,
          'PEKERJAAN': PEKERJAAN.text,
          'AGAMA': AGAMA.text,
          'WARGANEGARA': WARGANEGARA.text,
          'ALAMAT': alamat,
          'KETERANGAN': KETERANGAN.text,
          'EMAIL': EMAIL.text,
          'STATUS_KAWIN': STATUS_KAWIN.text,
          'BIDANG_USAHA': BIDANG_USAHA.text,
          'NO_HP': NO_HP.text,
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
      // // print(url);
      // print(response.body.toString());
      // return jsonDecode(response.body);
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
}
