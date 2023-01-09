import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/sentpage.dart';

class keterangandomisilicontainer extends StatefulWidget {
  const keterangandomisilicontainer({Key? key}) : super(key: key);

  @override
  State<keterangandomisilicontainer> createState() =>
      _keterangandomisilicontainerState();
}

class _keterangandomisilicontainerState
    extends State<keterangandomisilicontainer> {
  var _isloading = false;
  var jeniskelaminValue = jeniskelaminlist.first;
  var warganegaraValue = warganegaralist.first;
  var agamaValue = agamalist.first;
  var statuskawinValue = statuskawinlist.first;
  var rtValue = rtlist.first;
  var rwValue = rwlist.first;
  var dusunValue = dusunlist.first;

  TextEditingController NIK = TextEditingController();
  TextEditingController Nama = TextEditingController();
  TextEditingController TempatLahir = TextEditingController();
  TextEditingController TanggalLahir = TextEditingController();
  String JenisKelamin = '';

  // String Pekerjaan = '';

  TextEditingController Agama = TextEditingController();

  String StatusKawin = '';

  TextEditingController Pekerjaan = TextEditingController();
  TextEditingController Warganegara = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController NoHP = TextEditingController();
  TextEditingController Keterangan = TextEditingController();
  TextEditingController Alamat = TextEditingController();
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Data Diri ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        // FutureBuilder(
        //     // future: fetch(),
        //     builder: (context, AsyncSnapshot snapshot) {
        //   if (snapshot.hasData) {
        //     final response = snapshot.data;
        //     return Text(snapshot.data['data'][0]['JENIS_SURAT'].toString());
        //   } else {
        //     return Text('Loading');
        //   }
        //   // return Text(snapshot.toString());
        // }),
        Form(
            key: _formKey,
            child: Column(children: [
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
              // //textinput('NIK'),
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
                  controller: Nama,
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

                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30.0),
                    //   // borderSide: BorderSide(color: Colors.white, width: 0.0)
                    // ),
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Tempat Lahir',
                  ),
                  controller: TempatLahir,
                  validator: (value) =>
                      value!.isEmpty ? "Tidak boleh kosong" : null,
                ),
              ),
              //textinput('Tanggal Lahir'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: TanggalLahir,
                  readOnly: true,
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
                        TanggalLahir.text = formattedDate;
                      });
                    } else {}
                  },
                ),
              ),
              // //textinput('Jenis Kelamin'),
              // jeniskelamin(),
              //textinput('Pekerjaan'),

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: Pekerjaan,
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
                  validator: (value) =>
                      value!.isEmpty ? "Tidak boleh kosong" : null,
                ),
              ),
              // //textinput('Agama'),
              agama(),
              // //textinput('Alamat'),
              // textinputaddress(),
              // //textinput('Status Kawin'),
              statuskawin(),
              //textinput('Warganegara'),
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
                          Warganegara.text = valuewarganegara!;
                          if (Warganegara.text == "Warga Negara Asing") {
                            warganegaraValue = "";
                          }
                        });
                      },
                      value: Warganegara.text.isEmpty
                          ? warganegaralist.first
                          : Warganegara.text,
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
              if (Warganegara.text == "Warga Negara Asing")
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    onChanged: (value) {
                      warganegaraValue = value;
                    },
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
                      labelText: 'Warganegara',
                    ),
                    validator: (value) => warganegaraValue.isEmpty &&
                            warganegaraValue != "Warga Negara Asing"
                        ? "Tidak boleh kosong"
                        : null,
                  ),
                ),
              //textinput('Email'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: Email,
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
                  validator: (value) =>
                      value!.isEmpty ? "Tidak boleh kosong" : null,
                ),
              ),
              //textinput('No HP'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: NoHP,
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
                  validator: (value) =>
                      value!.isEmpty ? "Tidak boleh kosong" : null,
                  keyboardType: TextInputType.phone,
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
                      validator: (value) =>
                          value == rtlist.first ? 'Tidak boleh kosong' : null,
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
                      validator: (value) =>
                          value == rwlist.first ? 'Tidak boleh kosong' : null,
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
                      value: dusunValue.isEmpty ? dusunlist.first : dusunValue,
                      items: dusunlist
                          .map<DropdownMenuItem<String>>((String valuedusun) {
                        return DropdownMenuItem<String>(
                          value: valuedusun,
                          child: Text(valuedusun, textAlign: TextAlign.center),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              //textinput('Keterangan'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: Alamat,
                  minLines: 2,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
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
                    labelText: "Alamat",
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Tidak boleh kosong" : null,
                ),
              ),
              // //textinput('Alamat'),
              // textinputaddress(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: Keterangan,
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
              Container(
                margin: EdgeInsets.all(16.0),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return home()}))
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => sentpage(),
                    //     ));
                    // print(Nama.text);

                    setState(() {
                      _isloading = true;
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
            ]))
      ]),
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
        Nama.text = found['nama'].toString();
        jeniskelaminlist.forEach((element) {
          element.toLowerCase() == found['jk'].toString().toLowerCase()
              ? jeniskelaminValue = element
              : '';
        });
        TanggalLahir.text = found['tgl_lahir'].toString();
        TempatLahir.text = found['tempat_lahir'].toString();
        Pekerjaan.text = found['pekerjaan'].toString();
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
    // print(await ceknik(NIK.text));
    if (await ceknik(NIK.text) == false) {
      return nikError();
    } else {
      // print("jalan");
      var alamat = Alamat.text;
      alamat += ', Kec. Tumpang';
      alamat += dusunValue != dusunlist.first ? ', Dusun $dusunValue' : '';
      alamat += rtValue != rtlist.first ? ', RT $rtValue' : '';
      alamat += rwValue != rwlist.first ? ', RW $rwValue' : '';

      var url = Uri.parse(env.host + '/layananapi/jns4');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'NIK': NIK.text,
          'NAMA': Nama.text,
          'TEMPAT_LAHIR': TempatLahir.text,
          'TANGGAL_LAHIR': TanggalLahir.text,
          'JK': jeniskelaminValue,
          'JENIS_PEKERJAAN': Pekerjaan.text,
          'AGAMA': agamaValue,
          'KEWARGANEGARAAN': warganegaraValue,
          'ALAMAT': alamat,
          'JENIS_SURAT': '4',
          'KETERANGAN': Keterangan.text,
          'STATUS_KAWIN': statuskawinValue,
          'NO_HP': NoHP.text,
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

    // ceknik('3507161706860004');
  }
}
