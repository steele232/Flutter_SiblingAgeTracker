import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluro/fluro.dart';

//my own imports
import 'family.dart';
import 'notifications.dart';
import 'theme.dart';


// COPIED FROM https://marcinszalek.pl/flutter/flutter-fullscreendialog-tutorial-weighttracker-ii/

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
          trailing: new Material(
            child: new IconButton(
              icon: new Icon(Icons.add),
              onPressed: (() { Navigator.pop(context); }),
            ),
          ),

      ),
      child: new Center(child: new Text('Add a new little buddy!!')),
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