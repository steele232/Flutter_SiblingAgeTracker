import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

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

  final TextEditingController _nameTextController = new TextEditingController();
  final TextEditingController _monthTextController = new TextEditingController();
  final TextEditingController _dayTextController = new TextEditingController();
  final TextEditingController _yearTextController = new TextEditingController();

  @override
  void initState() {
    super.initState();
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
        type: MaterialType.transparency,
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
                          hintText: 'Name',
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
                                hintText: 'DD',
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
                                hintText: 'YYYY',
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
                    // 11/09/17 This at least prevents a break in the app.
                    if ( _nameTextController.text != ''
                          &&
                         _monthTextController.text != ''
                          &&
                         _dayTextController.text != ''
                          &&
                         _yearTextController.text != ''
                         ) {

                      FMSave save = new FMSave(
                          _nameTextController.text,
                          _monthTextController.text + '/' +
                          _dayTextController.text + '/' +
                          _yearTextController.text
                      );

                      Navigator.of(context).pop(save);
                    }

                  },
                )
              ),
            ]
        ),
      ),
    );
  }
}