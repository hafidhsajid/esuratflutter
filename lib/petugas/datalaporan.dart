import 'package:flutter/material.dart';
import 'package:simriwinkapp/petugas/datapermohonan.dart';
import 'package:simriwinkapp/petugas/detaildatalaporan.dart';
import 'package:simriwinkapp/petugas/homepagepetugas.dart';
import 'package:intl/intl.dart';
import 'package:simriwinkapp/petugas/login.dart';

class datalaporan extends StatefulWidget {
  const datalaporan({Key? key}) : super(key: key);

  @override
  State<datalaporan> createState() => _datalaporanState();
}

TextEditingController TanggalLahir = TextEditingController();
TextEditingController TanggalAkhir = TextEditingController();
TextEditingController TanggalAwal = TextEditingController();

class _datalaporanState extends State<datalaporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Petugas',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        backgroundColor: Color.fromRGBO(242, 248, 255, 1),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          GestureDetector(
            child: Image.asset('assets/logout.png', height: 80),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext _context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Apakah anda ingin melakukan logout'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(_context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pop(_context, 'OK');
                        // Navigator.pop(context);
                        Navigator.popUntil(context, (route) => false);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => login()));
                        setState(() {});
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(242, 248, 255, 1), //#F2F8FF
      //backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return homepagepetugas();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Data Pemohonan'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return datapermohonan();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Laporan'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return datalaporan();
                }));
              },
            ),
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: [
          // DatePickerDialog(initialDate: 1950, firstDate: 01, lastDate: 30),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              readOnly: true,
              controller: TanggalAwal,
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
                labelText: 'Tanggal Awal',
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
                    TanggalAwal.text = formattedDate;
                  });
                } else {}
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              readOnly: true,
              controller: TanggalAkhir,
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
                labelText: 'Tanggal Akhir',
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
                    TanggalAkhir.text = formattedDate;
                  });
                } else {}
              },
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detaildatalaporan(
                          awal: TanggalAwal.text, akhir: TanggalAkhir.text),
                    ));
                // print(Nama.text);

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
        ],
      )),
    );
  }
}
