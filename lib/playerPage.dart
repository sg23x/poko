import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({@required this.uid});
  String uid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("rooms")
          .doc("1001")
          .snapshots(),
      builder: (context, snap) {
        print(snap.data.data()['showFlop']);
        return Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BOARD: "),
                      Text(
                        snap.data.data()['showFlop'] == true
                            ? snap.data.data()['cardSequence'][0]
                            : "",
                      ),
                      Text(" "),
                      Text(
                        snap.data.data()['showFlop'] == true
                            ? snap.data.data()['cardSequence'][1]
                            : "",
                      ),
                      Text(" "),
                      Text(
                        snap.data.data()['showFlop'] == true
                            ? snap.data.data()['cardSequence'][2]
                            : "",
                      ),
                      Text(" "),
                      Text(
                        snap.data.data()['showTurn'] == true
                            ? snap.data.data()['cardSequence'][3]
                            : "",
                      ),
                      Text(" "),
                      Text(
                        snap.data.data()['showRiver'] == true
                            ? snap.data.data()['cardSequence'][4]
                            : "",
                      ),
                    ],
                  ),
                  Text("HOLE CARDS: " +
                      snap.data.data()['cardSequence']
                          [5 + 2 * (snap.data.data()['players'].indexOf(uid))] +
                      " " +
                      snap.data.data()['cardSequence'][5 +
                          2 * (snap.data.data()['players'].indexOf(uid)) +
                          1]),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
