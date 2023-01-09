import 'package:flutter/material.dart';

class sentpage extends StatelessWidget {
  final String body;
  final String nomor;
  final String keterangan;
  // final String nomor;
  const sentpage(
      {Key? key,
      required this.body,
      required this.nomor,
      required this.keterangan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var decode = jsonDecode(this.body);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('Form Pengajuan'),
      //   toolbarHeight: 80,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(30),
      //     ),
      //   ),
      // ),
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text("Kembali Ke Beranda"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color.fromRGBO(242, 248, 255, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset('assets/clipboard-check-solid.png'),
            ),
            // Text(decode['message'].toString()),
            Text(
              "Nomor Permohonan Anda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              this.nomor,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Sudah Berahasil Diajukan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              this.keterangan,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
