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
      title: 'Flutter Demo',
      theme: kIOSTheme,
      home: new MyHomePage(title: '  Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _sayYes() {
    Navigator.pop(context);
  }

  void _sayNo() {
    Navigator.pop(context);
  }

  void _showDialog() {

    setState(() {

      //TODO: Here we want to show a dialog.
      //showDialog: https://docs.flutter.io/flutter/material/showDialog.html
      switch (_counter % 3) {
        case 0:
        //Create a CupertinoAlertDialog
        //see https://docs.flutter.io/flutter/cupertino/CupertinoAlertDialog-class.html
          _counter += 1;

          showDialog(
              context: context,
              child: new CupertinoAlertDialog(
                title: new Text("Test2"),
                content: new Text("Hello World"),
                actions: <Widget> [
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

          break;
        case 1:
        //Create a CupertinoDialog
        //see https://docs.flutter.io/flutter/cupertino/CupertinoDialog-class.html
          _counter += 2;

          break;
        case 2:
        //Create a CupertinoDialogAction
        //see https://docs.flutter.io/flutter/cupertino/CupertinoDialogAction-class.html
          break;
      }

//      showDialog(
//          context: context,
//          child: new Text("Hello World")
//      );

//      showDialog(
//          context: context,
//          child: new CupertinoAlertDialog(
//            title: new Text("Test"),
//            content: new Text("Hello World"),
//          )
//      );

//          showDialog(
//              context: context,
//              child: new CupertinoDialog(
//                child: new Text("Hello World"),
//              )
//          );

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new CupertinoTabScaffold(
      tabBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem> [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.people),
              title: new Text(" ")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.notifications),
              title: new Text(" ")
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
                    middle: new Text('Family Members'),
                  ),
                  child: new Center(
                    child: new Text("Page $index"),
                  ),
                );
                break;
              case 1:
                return new CupertinoPageScaffold(
                  navigationBar: new CupertinoNavigationBar(
                    middle: new Text('Notifications'),
                  ),
                  child: new Center(
                    child: new Text("Page $index"),
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
