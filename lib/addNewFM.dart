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
              new Container (
                padding: new EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                height: 400.0,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new TextField(
                        autocorrect: true,
                        decoration: new InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              decoration: new InputDecoration(
                                hintText: 'MM',
                                labelText: 'Month',
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              decoration: new InputDecoration(
                                hintText: 'MM',
                                labelText: 'Month',
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
  //                            maxLines: 2,
                              decoration: new InputDecoration(
                                hintText: 'MM',
                                labelText: 'Month',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              ),

              new Center(
                child: new CupertinoButton(
                  child: new Text('Add Family Member'),
                  onPressed: () {
                    //collect and put into a FMSave
                      //RELY ON THE STATE.

                    //pop the FMSave
                    Navigator.of(context).pop(new FMSave('Jonathan STEELE', '01/05/1995'));
                  },
                )
              ),
            ]
        ),
      ),
    );
  }
}