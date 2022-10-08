import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/formpengajuan.dart';
import 'package:simriwinkapp/pemohon/lacaksurat/lacaksurat.dart';
import 'package:http/http.dart' as http;

class homepagepemohon extends StatefulWidget {
  const homepagepemohon({Key? key}) : super(key: key);

  @override
  State<homepagepemohon> createState() => _homepagepemohonState();
}

class _homepagepemohonState extends State<homepagepemohon> {
  int _currentIndex = 0;
  List cardList = [Item1(), Item1(), Item1()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 248, 255, 1), //#F2F8FF
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Hi Pemohon',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Image.asset('assets/logout.png', height: 80),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              CarouselSlider(
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                    aspectRatio: 2.0,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    //autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Our Services',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              GridView.count(
                //childAspectRatio: 3/2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 2,
                crossAxisSpacing: 3,
                crossAxisCount: 3,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => formpengajuan(),
                          ));
                    },
                    child: Column(
                      children: [
                        Card(
                          child:
                              //Image.asset('assets/logout.png',height: 80),
                              Image.asset('assets/file.png', height: 80),
                        ),
                        Text('Pengajuan Surat'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => lacaksurat(),
                          ));
                    },
                    child: Column(
                      children: [
                        Card(
                          child:
                              //Image.asset('assets/logout.png',height: 80),
                              Image.asset('assets/file.png', height: 80),
                        ),
                        Text('Lacak Surat'),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => formpengajuan1(),
                  //         ));
                  //   },
                  //   child: Column(
                  //     children: [
                  //       Card(
                  //         child:
                  //             //Image.asset('assets/logout.png',height: 80),
                  //             Image.asset('assets/file.png', height: 80),
                  //       ),
                  //       Text('1'),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              // Text(env.host),
            ],
          ),
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pengumuman!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text("Pengajuan Surat Libur Minggu ini",
              style: TextStyle(color: Colors.white, fontSize: 17.0)),
        ],
      ),
    );
  }
}
