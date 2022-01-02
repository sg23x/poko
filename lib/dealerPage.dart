import 'package:flutter/material.dart';

class DealerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                child: Text("NLH"),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("PLO"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
