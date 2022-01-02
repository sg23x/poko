import 'package:flutter/material.dart';
import 'package:poko/dealerPage.dart';
import 'package:poko/shuffler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaff(),
    );
  }
}

class Scaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("DEALER"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DealerPage()));
                  // FirebaseFirestore.instance
                  //     .collection('rooms')
                  //     .doc("1001")
                  //     .set(
                  //   {
                  //     "cardSequence": shuffler(),
                  //   },
                  // );
                },
              ),
              RaisedButton(
                child: Text("PLAYER"),
                onPressed: () {
                  // FirebaseFirestore.instance.collection('rooms').doc("1001").set(
                  //   {
                  //     "cardSequence": shuffler(),
                  //   },
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
