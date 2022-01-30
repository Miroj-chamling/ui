import 'package:editprofile/screen/editprofile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edit Profile',
      theme: ThemeData(
        primaryColor: const Color(0xff003060),
        primarySwatch: Colors.blue,
        secondaryHeaderColor: const Color(0xffC78E53),
      ),
      home: EditProfile(),
    );
  }
}
