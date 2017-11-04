import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class NotificationsPage extends StatefulWidget {

  @override
  State createState() => new NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {


  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text(
            'Notifications',
            style: Theme.of(context).textTheme.subhead,
            textDirection: TextDirection.ltr,
        ),
      ),
      child: new Center(
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
    );
  }
}