import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';

class keterangantidakmampusekolah extends StatefulWidget {
  const keterangantidakmampusekolah({Key? key}) : super(key: key);

  @override
  State<keterangantidakmampusekolah> createState() =>
      _keterangantidakmampusekolahState();
}

class _keterangantidakmampusekolahState
    extends State<keterangantidakmampusekolah> {
  var jeniskelaminValue = jeniskelaminlist.first;
  var jeniskelaminanakValue = jeniskelaminlist.first;
  var agamaValue = agamalist.first;
  var statuskawinValue = statuskawinlist.first;
  var rtValue = rtlist.first;
  var rwValue = rwlist.first;
  var dusunValue = dusunlist.first;
  // TextEditingController TanggalLahirOrangtua = TextEditingController();
  // TextEditingController TanggalLahirAnak = TextEditingController();

  TextEditingController NIK = TextEditingController();
  TextEditingController NAMA = TextEditingController();
  TextEditingController TEMPAT_LAHIR = TextEditingController();
  TextEditingController TGL_LAHIR = TextEditingController();
  TextEditingController JK = TextEditingController();
  TextEditingController PEKERJAAN = TextEditingController();
  TextEditingController STATUS_KAWIN = TextEditingController();
  TextEditingController ALAMAT = TextEditingController();
  TextEditingController KETERANGAN = TextEditingController();
  TextEditingController EMAIL = TextEditingController();
  TextEditingController NIK_ANAK = TextEditingController();
  TextEditingController NAMA_ANAK = TextEditingController();
  TextEditingController TEMPAT_LAHIR_ANAK = TextEditingController();
  TextEditingController TGL_LAHIR_ANAK = TextEditingController();
  TextEditingController JK_ANAK = TextEditingController();
  TextEditingController PEKERJAAN_ANAK = TextEditingController();
  TextEditingController NO_HP = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void validate() {
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Data Orang Tua ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                              // DateFormat('yyyy-MM-dd').format(pickedDate);
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          setState(() {
                            TGL_LAHIR.text = formattedDate;
                          });
                        } else {}
                      },
                    ),
                  ),
                  // textinput('Jenis Kelamin'),
                  // jeniskelamin(),
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
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) => value == jeniskelaminlist.first
                              ? 'Tidak boleh kosong'
                              : null,
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
                  // agama(),
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
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) => value == agamalist.first
                              ? 'Tidak boleh kosong'
                              : null,

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
                  // textinput('Alamat'),
                  // textinput('Status Kawin'),
                  statuskawin(),
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
                      controller: NO_HP,
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Data Anak ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
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
                      keyboardType: TextInputType.number,
                      controller: NIK_ANAK,
                      onChanged: (value) {
                        if (value.length == 16) {
                          getnikanak(NIK_ANAK.text);
                        }
                      },
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
                      controller: NAMA_ANAK,
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
                      controller: TEMPAT_LAHIR_ANAK,
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
                      controller: TGL_LAHIR_ANAK,
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
                            TGL_LAHIR_ANAK.text = formattedDate;
                          });
                        } else {}
                      },
                    ),
                  ),
                  // textinput('Jenis Kelamin'),
                  // jeniskelamin(),
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
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          onChanged: (String? valuejeniskelaminanak) {
                            setState(() {
                              jeniskelaminanakValue = valuejeniskelaminanak!;
                            });
                          },
                          validator: (value) => value == jeniskelaminlist.first
                              ? 'Tidak boleh kosong'
                              : null,
                          value: jeniskelaminanakValue.isEmpty
                              ? jeniskelaminlist.first
                              : jeniskelaminanakValue,
                          items: jeniskelaminlist.map<DropdownMenuItem<String>>(
                              (String valuejeniskelaminanak) {
                            return DropdownMenuItem<String>(
                              value: valuejeniskelaminanak,
                              child: Text(valuejeniskelaminanak,
                                  textAlign: TextAlign.center),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
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
                      controller: PEKERJAAN_ANAK,
                    ),
                  ),
                ])),

        // textinput('NIK'),

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
                  borderSide: BorderSide(color: Colors.white)),
            ),
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
            // underline: SizedBox(),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
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
          child: DropdownButtonFormField(
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            elevation: 16,
            // underline: SizedBox(),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
            onChanged: (String? valuestatuskawin) {
              setState(() {
                statuskawinValue = valuestatuskawin!;
              });
            },
            validator: (value) =>
                value == statuskawinlist.first ? 'Tidak boleh kosong' : null,
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
        statuskawinlist.forEach((element) {
          element.toLowerCase() ==
                  found['status_kawin'].toString().toLowerCase()
              ? statuskawinValue = element
              : '';
        });
      });
    }
  }

  Future getnikanak(String nik) async {
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
        NAMA_ANAK.text = found['nama'].toString();
        jeniskelaminlist.forEach((element) {
          element.toLowerCase() == found['jk'].toString().toLowerCase()
              ? jeniskelaminanakValue = element
              : '';
        });
        TGL_LAHIR_ANAK.text = found['tgl_lahir'].toString();
        TEMPAT_LAHIR_ANAK.text = found['tempat_lahir'].toString();
        PEKERJAAN_ANAK.text = found['pekerjaan'].toString();
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
    } else if (await ceknik(NIK_ANAK.text) == false) {
      return nikError(message: "NIK Anak tidak ditemukan harap hubungi admin.");
    } else {
      var alamat = ALAMAT.text;
      alamat += ', Kec. Tumpang';
      alamat += dusunValue != dusunlist.first ? ', Dusun $dusunValue' : '';
      alamat += rtValue != rtlist.first ? ', RT $rtValue' : '';
      alamat += rwValue != rwlist.first ? ', RW $rwValue' : '';

      var url = Uri.parse(env.host + '/layananapi/jns6');
      var response = await http.post(url,
          headers: <String, String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(<String, String>{
            'JENIS_SURAT': "6",
            'NIK': NIK.text,
            'NAMA': NAMA.text,
            'TEMPAT_LAHIR': TEMPAT_LAHIR.text,
            'TGL_LAHIR': TGL_LAHIR.text,
            'JK': jeniskelaminValue,
            'PEKERJAAN': PEKERJAAN.text,
            'STATUS_KAWIN': STATUS_KAWIN.text,
            'ALAMAT': alamat,
            'KETERANGAN': KETERANGAN.text,
            'EMAIL': EMAIL.text,
            'NIK_ANAK': NIK_ANAK.text,
            'NAMA_ANAK': NAMA_ANAK.text,
            'TEMPAT_LAHIR_ANAK': TEMPAT_LAHIR_ANAK.text,
            'TGL_LAHIR_ANAK': TGL_LAHIR_ANAK.text,
            'JK_ANAK': jeniskelaminanakValue,
            'PEKERJAAN_ANAK': PEKERJAAN_ANAK.text,
            'NO_HP': NO_HP.text,
          }));
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
    }
    // print(url);
    // print(response.statusCode.toString());
    // print(response.body.toString());
    // return jsonDecode(response.body);
  }
}
