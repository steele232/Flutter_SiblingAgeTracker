import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.blueGrey,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Grandkid Tracker Pro',
      theme: kIOSTheme,
      home: new MyHomePage(title: '  Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _sayYes() {
    Navigator.pop(context);
    //TODO: Create a dialog for Adding a family member..
    //
  }

  void _sayNo() {
    Navigator.pop(context);
  }

  void _showDialog() {
    setState(() {
      //TODO: Here we want to show a dialog.
      //showDialog: https://docs.flutter.io/flutter/material/showDialog.html

      //Create a CupertinoAlertDialog
      //see https://docs.flutter.io/flutter/cupertino/CupertinoAlertDialog-class.html
//      _counter += 1;

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

      //Create a CupertinoDialog
      //see https://docs.flutter.io/flutter/cupertino/CupertinoDialog-class.html

      //Create a CupertinoDialogAction
      //see https://docs.flutter.io/flutter/cupertino/CupertinoDialogAction-class.html

    });
  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoTabScaffold(
      tabBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: new Text(
                  "Family",
                  textScaleFactor: 1.0,
                  style: Theme.of(context).textTheme.subhead
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.notifications),
            title: new Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: new Text(
                  "Notifications",
                  textScaleFactor: 1.0,
                  style: Theme.of(context).textTheme.subhead
              ),
            ),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return new CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
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
                break;
              case 1:
                return new CupertinoPageScaffold(
                  navigationBar: new CupertinoNavigationBar(
                    middle: const Text(
                      'Notifications'
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
                break;
            }
          },
        );
      },
    );
    //end..
  }
}

