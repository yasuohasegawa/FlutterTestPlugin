import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:FlutterTestPlugin/FlutterTestPlugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _dialogResult = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    String dialogResult;
    try {
      dialogResult = await PlatformOriginDialog.showDialog("確認", "保存しますか？");
    } on PlatformException {
      dialogResult = 'Failed to show Dialog.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _dialogResult = dialogResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: 
        Center(child: Column(children: <Widget>[
          new Text('Dialog result: $_dialogResult\n'),
          MaterialButton(
            child: Text("Button"),
            onPressed: () {
            initPlatformState();
          },)
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ))
      ),
    );
  }
}