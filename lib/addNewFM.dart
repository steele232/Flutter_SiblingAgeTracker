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

  TextEditingController _nameTextController;
  TextEditingController _monthTextController;
  TextEditingController _dayTextController;
  TextEditingController _yearTextController;

  @override
  void initState() {
    _nameTextController = new TextEditingController();
    _monthTextController = new TextEditingController();
    _dayTextController = new TextEditingController();
    _yearTextController = new TextEditingController();
  }


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
                    new Text(
                      'Name',
                      textAlign: TextAlign.left,
                    ),
                    new Container(
                      padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new TextField(
                        autocorrect: true,
                        controller: _nameTextController,
                        decoration: new InputDecoration(
//                          hintText: 'Name',
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    new Text(
                      'Birth Date',
                      textAlign: TextAlign.left,
                    ),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              controller: _monthTextController,
                              decoration: new InputDecoration(
                                hintText: 'MM',
                                labelText: 'MM',
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              controller: _dayTextController,
                              decoration: new InputDecoration(
//                                hintText: 'MM',
                                labelText: 'DD',
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              controller: _yearTextController,
                              decoration: new InputDecoration(
//                                hintText: 'MM',
                                labelText: 'YYYY',
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

                    // TODO CHECK TO SEE IF THE INPUT IS VALID.

                    //pop the FMSave
                    Navigator.of(context)
                        .pop(
                          new FMSave(
                            _nameTextController.text,
                            _monthTextController.text + '/' +
                            _dayTextController.text + '/' +
                            _yearTextController.text

                            ),
                          );
                  },
                )
              ),
            ]
        ),
      ),
    );
  }





}