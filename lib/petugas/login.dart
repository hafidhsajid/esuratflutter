import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simriwinkapp/main.dart';
import 'package:simriwinkapp/pemohon/homepage.dart';
import 'package:simriwinkapp/petugas/homepagepetugas.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _isloading = false;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool _isError = false;
  var _formKey = GlobalKey<FormState>();

  void validate() {
    final form = _formKey.currentState?.validate();
    if (!form!) {
      // print('Form is valid');
    } else {
      _isloading = true;
      ceklogin(context);
      // print('Form is invalid');
    }
    setState() {}
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          style: TextStyle(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.left,
                          'Login Petugas'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.left,
                          'Please login to continue'),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: usernamecontroller,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Username tidak bisa kosong'
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Colors.grey,
                                ),
                                //errorText: _isError ? 'Username atau Password Salah' : null,
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Password tidak bisa kosong'
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
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
                              child: _isloading == true
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Atau ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Masuk Sebagai Pemohon',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return homepagepemohon();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Text(
                                'Pemohon',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future ceklogin(BuildContext context) async {
    var url = Uri.parse(env.host + '/petugasapi/homeapi/login');
    print(url);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'username': usernamecontroller.text,
        'password': passwordcontroller.text,
      }),
    );
    Map<String, dynamic> userMap = jsonDecode(response.body);
    userMap['statuscode'] = response.statusCode;
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homepagepetugas(),
          ));
      _isloading = false;
    } else {
      _isloading = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Username atau Password Salah'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }

    print(userMap.toString());
    return userMap;
  }
}

// bool _isloading = false;
// TextEditingController usernamecontroller = TextEditingController();
// TextEditingController passwordcontroller = TextEditingController();
