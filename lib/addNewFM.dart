import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluro/fluro.dart';

//my own imports
import 'family.dart';
import 'familymember.dart';
import 'notifications.dart';
import 'theme.dart';


// COPIED FROM https://marcinszalek.pl/flutter/flutter-fullscreendialog-tutorial-weighttracker-ii/

class FMSave {
  FMSave(this.name, this.date);
  String name;
  String date;
}

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
          backgroundColor: kIOSTheme.backgroundColor,
          leading: new Material(
              child: new IconButton(
                icon: new Icon(Icons.clear),
                onPressed: (() {
                  Navigator.pop(context);
                })
              ),
          ),
          middle: new Text('Add Family Member',
            style: Theme.of(context).textTheme.subhead,
          ),
      ),
      child: new Material(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              new Divider(height: 89.0,) ,
              new Text('Add a new little buddy!!'),
              new TextField(),
              new TextField(),
              new Center(
                child: new CupertinoButton(
                  child: new Text('Add Family Member'),
                  onPressed: () {
                    //collect and put into a FMSave
                      //RELY ON THE STATE.
                    FMSave save = new FMSave('Jonathan STEELE', '01/05/1995');

                    //pop the FMSave
                    Navigator.of(context).pop(save);
                  },
                )
              ),
            ]
        ),
      ),

//      appBar: new AppBar(
//        title: const Text('New entry'),
//        actions: [
//          new FlatButton(
//              onPressed: () {
//                //TODO: Handle save
//              },
//              child: new Text('SAVE',)
//          ),
//        ],
//      ),
//      body: new Text("Foo"),
    );
  }
}