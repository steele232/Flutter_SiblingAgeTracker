import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class FamilyMemberPage extends StatefulWidget {

  @override
  State createState() => new FamilyMemberPageState();
}

class FamilyMemberPageState extends State<FamilyMemberPage> {


  void _sayYes() {
    Navigator.pop(context);
    //TODO: Create a dialog for Adding a family member..
    //
  }

  void _sayNo() {
    Navigator.pop(context);
  }

  void _showDialog() {
    showDialog(
      context: context,
      child: new CupertinoAlertDialog(
        title: new Text("Test2"),
        content: new Text("Hello World"),
        actions: <Widget>[
          new CupertinoDialogAction(
            child: new Text("No"),
            onPressed: _sayNo,
          ),
          new CupertinoDialogAction(
            child: new Text("Yes"),
            isDefaultAction: true,
            onPressed: _sayYes,
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Container(
          child: new Text(
            'Family Members',
            style: Theme.of(context).textTheme.subhead,
            textDirection: TextDirection.ltr,
          ),
        ),
        trailing: new Material(
          child: new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showDialog,
          ),
        ),
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Divider(height: 75.0),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    'Deliver features faster',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
              ],

            ),
            new Expanded(
              child: new Text(
                'Deliver features faster',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.subhead,

              ),
            ),
            new Expanded(
              child: new Text(
                'Deliver features faster',
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

      ),
    );
  }
}