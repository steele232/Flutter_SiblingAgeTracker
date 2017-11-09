import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'theme.dart';


class NotificationsPage extends StatefulWidget {

  @override
  State createState() => new NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {

  bool _birthdayIsOn;
  bool _dayOf;
  bool _dayBefore1;
  bool _dayBefore2;
  bool _dayBefore3;
  bool _wkBefore1;
  bool _wkBefore2;
  bool _monthBefore1;
  bool _monthBefore2;

  @override
  void initState() {
    _birthdayIsOn = false;
    _dayOf = false;
    _dayBefore1 = false;
    _dayBefore2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        backgroundColor: kIOSTheme.backgroundColor, // opacity corrected for proper behavior
        middle: new Text(
            'Notifications',
            style: Theme.of(context).textTheme.subhead,
            textDirection: TextDirection.ltr,
        ),
      ),
      child: new Column(
        children: <Widget>[
          new Material(
            type: MaterialType.transparency,
            child: new ListTile(
              subtitle: new Text('Birthday Notifications'), //TODO IMPROVE THIS TYPOGRAPHY / SIZE / DARKNESS.
              trailing: new CupertinoSwitch(value: _birthdayIsOn, onChanged: (bool value) {
                setState(() {
                  _birthdayIsOn = value;
                });
              }),
            ),
          ),
          new Divider(height: 20.0),
          new Material(
            type: MaterialType.transparency,
            child: new Column(
              children: <Widget>[
                new ListTile(
                  subtitle: new Text('Day Of'),
                  trailing: new CupertinoSwitch(value: _dayOf, onChanged: (bool value) {
                    setState(() {
                      _dayOf = value;
                    });
                  }),
                ),
                new ListTile(
                  subtitle: new Text('Day Before'),
                  trailing: new CupertinoSwitch(value: _dayBefore1, onChanged: (bool value) {
                    setState(() {
                      _dayBefore1 = value;
                    });
                  }),
                ),
                new ListTile(
                  subtitle: new Text('2 Days Before'),
                  trailing: new CupertinoSwitch(value: _dayBefore2, onChanged: (bool value) {
                    setState(() {
                      _dayBefore2 = value;
                    });
                  }),
                ),

              ],
            )
          ),
          new Center(
            child: new Text(
              'Test Text',
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.subhead,
              overflow: TextOverflow.clip,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}