import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'familymember.dart';

class FamilyMemberPage extends StatefulWidget {

  @override
  State createState() => new FamilyMemberPageState();
}

class FamilyMemberPageState extends State<FamilyMemberPage> {
  List<FamilyMember> _familyMembers = <FamilyMember>[];

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
        title: new Text("Add a Family Member"),
        content: new Text("Are you sure?"),
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

  Widget _itemBuilder (BuildContext context, int index) {
    FamilyMember familyMember = getFM(index);

    return new FamilyMemberWidget(familyMember: familyMember);
  }

  FamilyMember getFM(int index) {
    return _familyMembers[index];
  }

  @override
  Widget build(BuildContext context) {

    //TODO first let's make a hard copy of the familyMembers I want to see.


    _familyMembers = <FamilyMember> [
      new FamilyMember(
        "Jonathan",
        "01/05/1995",
      ),
      new FamilyMember(
        "Jonathan",
        "01/05/1995",
      ),
      new FamilyMember(
        "Jonathan",
        "01/05/1995",
      ),
      new FamilyMember(
        "Jonathan",
        "01/05/1995",
      ),
      new FamilyMember(
        "Jonathan",
        "01/05/1995",
      ),
    ];


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
//        width: 350.0,
//        constraints: new ConstrainedBox(constraints: ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Divider(height: 75.0),
            new ListView.builder(
                padding: new EdgeInsets.symmetric(horizontal: 8.0),
                shrinkWrap: true,
                itemBuilder: _itemBuilder,
                itemCount: _familyMembers.length,
            ),
          ],
        )
      ),
    );
  }
}



class FamilyMemberWidget extends StatefulWidget {
  FamilyMemberWidget({Key key, this.familyMember}) : super(key: key);

  final FamilyMember familyMember;

  @override
  FamilyMemberWidgetState createState() => new FamilyMemberWidgetState(familyMember: familyMember);
}

class FamilyMemberWidgetState extends State<FamilyMemberWidget> {
  FamilyMemberWidgetState({Key key, this.familyMember});

  final FamilyMember familyMember;

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.grey[100],
//      type: Material.of(context),
      child: new ListTile(
        leading: new Text(familyMember.name),
        trailing: new Text(familyMember.birthDate),
        onTap: _onTap,
      ),
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
        title: new Text("Edit Details"),
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