import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poko/shuffler.dart';

class DealerPage extends StatefulWidget {
  @override
  _DealerPageState createState() => _DealerPageState();
}

class _DealerPageState extends State<DealerPage> {
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('rooms')
          .doc("1001")
          .snapshots(),
      builder: (context, snap) {
        List butts = [
          RaisedButton(
            child: Text(
              "Show Flop",
            ),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("rooms")
                  .doc("1001")
                  .update({"showFlop": true});
              ind = 1;
            },
          ),
          RaisedButton(
            child: Text(
              "Show Turn",
            ),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("rooms")
                  .doc("1001")
                  .update({"showTurn": true});
              ind = 2;
            },
          ),
          RaisedButton(
            child: Text(
              "Show River",
            ),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("rooms")
                  .doc("1001")
                  .update({"showRiver": true});
              ind = 3;
            },
          ),
          RaisedButton(
            child: Text(
              "New Game",
            ),
            onPressed: () {},
          ),
        ];
        return Scaffold(
          appBar: AppBar(
            title: Text("Room ID: 1001"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('rooms')
                          .doc("1001")
                          .set(
                        {
                          "cardSequence": shuffler(),
                          "showFlop": false,
                          "showTurn": false,
                          "showRiver": false,
                          "players": []
                        },
                      );
                    },
                    child: Text("NLH"),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("PLO"),
                  ),
                ],
              ),
              butts[ind],
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
            ],
          ),
        );
      },
    );
  }
}
