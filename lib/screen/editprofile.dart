import 'dart:ffi';

import 'package:editprofile/models/student.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final student = [
    new StudentData(
      id: 1,
      email: "mirojrai01@gmail.com",
      name: "Miroj",
      phone: "9818030504",
      address: "Kapan-3,Kathmandu",
      photo: "",
      studyLevel: "Bachelors 1st Sem",
      createdAt: DateTime.now(),
      emailVerifiedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 160,
                        color: Theme.of(context).primaryColor,
                      ),
                      Positioned(
                        child: Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child:
                                    buildDetails("User Name", student[0].name),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: buildDetails("Email", student[0].email),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child:
                                    buildDetails("Address", student[0].address),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: buildDetails(
                                    "Phone Number", student[0].phone),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: buildDetails(
                                    "Study Level", student[0].studyLevel),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: fixedDetails(
                                  "Date of Join",
                                  formattedDateTime(student[0].emailVerifiedAt),
                                ),
                              ), //........
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: fixedDetails(
                                  "Verification Date",
                                  formattedDateTime(student[0].createdAt),
                                ),
                              ), //........
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext builderContext) {
                                      Future.delayed(Duration(seconds: 1), () {
                                        Navigator.of(builderContext).pop();
                                      });

                                      return AlertDialog(
                                        content: Text('Changes Saved'),
                                      );
                                    }),
                                child: const Text(
                                  "Save Changes",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 80,
                    left: 133,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 78,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/pp.jpg'),
                            radius: 75,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 12,
                          child: GestureDetector(
                            onTap: () {
                              print("opens camera");
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 22,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildDetails(String hintText, String placeHolder) {
    return TextFormField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeHolder,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
      ),
    );
  }

  TextFormField fixedDetails(String hintText, String placeHolder) {
    return TextFormField(
      enabled: false,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeHolder,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
      ),
    );
  }

  String formattedDateTime(DateTime dateTime) {
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }
}
