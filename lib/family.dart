import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'familymember.dart';

class FamilyMemberPage extends StatefulWidget {

  @override
  State createState() => new FamilyMemberPageState();
}

class FamilyMemberPageState extends State<FamilyMemberPage> {
  final List<FamilyMember> _familyMembers = <FamilyMember>[];

  void _sayYes() {
    Navigator.pop(context);
    //TODO: Create a dialog for Adding a family member..
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

    //TODO first let's make a hard copy of the familyMembers I want to see.


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
            new Container(
            child: new Column(
                children: <Widget>[
                  new Flexible(
                      child: new ListView.builder(
                        padding: new EdgeInsets.all(8.0),
                        reverse: true,
                        itemBuilder: (_,  int index) => _familyMembers[index],
                        itemCount: _familyMembers.length,
                      )
                  ),
//                  new Divider(height: 1.0),
//                  new Container(
//                    decoration: new BoxDecoration(
//                        color: Theme.of(context).cardColor
//                    ),
//                    child: _buildTextComposer(),
//                  ),
                ]
            ),
            decoration: Theme.of(context).platform == TargetPlatform.iOS
                ? new BoxDecoration(
                border:
                new Border(top: new BorderSide(color: Colors.grey[200])))
                : null),
            ),
          ],
        ),

      ),
    );
  }
}



class FamilyMemberWidget extends StatefulWidget {
  FamilyMemberWidget({Key key, this.familyMember}) : super(key: key);

  final FamilyMember familyMember;

  @override
  FamilyMemberWidgetState createState() => new FamilyMemberWidgetState();
}

class FamilyMemberWidgetState extends State<FamilyMemberWidget> {
  FamilyMemberWidgetState({Key key, this.familyMember}) : super(key: key);

  final FamilyMember familyMember;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Text(familyMember.name),
      trailing: new Text('age'),

//      Image.asset(widget.spec.pic.assetName),
      //title: new Text(widget.spec.name),
      onTap: _onTap,
    );
  }

  /*
  //TODO Dialog for Editing a Family Member
   */
  void _sayYes() {
    Navigator.pop(context);
    //
  }
  void _sayNo() {
    Navigator.pop(context);
  }

  void _onTap() {
    showDialog(
      context: context,
      child: new CupertinoAlertDialog(
        title: new Text(familyMember.name),
        content: new Text("Do you want to edit " + familyMember.name + "?"),
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

//    Route route = new MaterialPageRoute(
//      settings: new RouteSettings(name: "/specs/spec"),
//      builder: (BuildContext context) => new SpecPage(spec: widget.spec),
//    );
//    Navigator.of(context).push(route);
  }
}