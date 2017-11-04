import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//my own imports
import 'family.dart';
import 'notifications.dart';

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

  @override
  Widget build(BuildContext context) {
    return new DefaultTextStyle(
        style: new TextStyle(
          fontFamily: "Roboto"
        ),
        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                icon: new Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                      right: 10.0,
                      bottom: 0.0,
                    ),
                    child: new Icon(
                        Icons.people,
                    ),
                  ),
                title: new Container(
                  margin: const EdgeInsets.only(
                      left: 10.0,
                      top: 0.0,
                      right: 10.0,
                      bottom: 0.0,
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: new Text(
                    "Family",
                    textScaleFactor: .80,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
              ),
              new BottomNavigationBarItem(
                icon: new Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    top: 10.0,
                    right: 10.0,
                    bottom: 0.0,
                  ),
                  child: new Icon(
                      Icons.notifications,
                  ),
                ),
                title: new Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    top: 0.0,
                    right: 10.0,
                    bottom: 0.0,
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: new Text(
                    "Notifications",
                    textScaleFactor: .80,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subhead,
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
                      return new FamilyMemberPage();
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
        )
    );

    //end..
  }
}

