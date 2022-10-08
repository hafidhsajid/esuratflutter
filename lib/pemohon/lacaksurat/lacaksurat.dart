import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simriwinkapp/pemohon/lacaksurat/datalacaksuat.dart';

class lacaksurat extends StatefulWidget {
  const lacaksurat({Key? key}) : super(key: key);

  @override
  State<lacaksurat> createState() => _lacaksuratState();
}

var lacaksuratValue = lacaksuratlist.first;
var _datacontroller = TextEditingController();
var _datasuratcontroller = TextEditingController();

class _lacaksuratState extends State<lacaksurat> {
  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Color.fromRGBO(242, 248, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            dropdownmetode(),
            if (lacaksuratValue == 'NIK')
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _datacontroller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                        ],
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Masukkan NIK',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => datalacaksurat(
                                    // data: '3507161706860004'
                                    data: _datacontroller.text,
                                    metode: 'NIK'),
                              ));

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
                          'Cari',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            if (lacaksuratValue == 'Nomor Surat')
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _datasuratcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Masukkan Nomor Surat',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => datalacaksurat(
                                    data: _datasuratcontroller.text,
                                    metode: 'nomor_ajuan'),
                                // metode: 'nomor_ajuan'),
                              ));

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
                          'Cari',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // if (lacaksuratValue != 'Pilih Jenis Surat')
          ],
        )),
      ),
    );
  }

  dropdownmetode() {
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
            onChanged: (String? valuelacaksurat) {
              setState(() {
                lacaksuratValue = valuelacaksurat!;
              });
            },
            value: lacaksuratValue.isEmpty
                ? lacaksuratlist.first
                : lacaksuratValue,
            items: lacaksuratlist
                .map<DropdownMenuItem<String>>((String valuelacaksurat) {
              return DropdownMenuItem<String>(
                value: valuelacaksurat,
                child: Text(valuelacaksurat, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

List<String> lacaksuratlist = <String>[
  'Pilih Jenis Surat',
  'NIK',
  'Nomor Surat',
];
