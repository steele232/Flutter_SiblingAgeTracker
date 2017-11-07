import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'familymember.dart';

import 'theme.dart';


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



  @override
  Widget build(BuildContext context) {

    //For now, let's make a hard copy of the familyMembers I want to see.
    //TODO Use Firebase or some other Data Service to populate the list

    _familyMembers = <FamilyMember> [
      new FamilyMember(
        "Jonathan",
        "01/05/1995",
      ),
      new FamilyMember(
        "Sara",
        "04/29/1997",
      ),
      new FamilyMember(
        "Stephanie",
        "02/01/1997",
      ),
      new FamilyMember(
        "Spencer",
        "07/29/1992",
      ),
      new FamilyMember(
        "Timothy",
        "07/29/1992",
      ),
      new FamilyMember(
        "Austin",
        "07/29/1992",
      ),
      new FamilyMember(
        "Elise",
        "01/16/1988",
      ),
    ];


    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        backgroundColor: const Color(0xFFF8F8F8), // this is adjusted from 0xCCF8F8F8 to be opacity 1.0
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

      child: new ListView(
        children: _familyMembers.map((FamilyMember familyMember) {
          return new FamilyMemberWidget(familyMember: familyMember,);
        }).toList(),
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
      color: Colors.grey[80],
      type: MaterialType.transparency,
      child: new ListTile(
        leading: new CircleAvatar(child: new Text(familyMember.name.substring(0, 1)),),
        title: new Container(
            child: new Text(familyMember.name),
        ),
        subtitle: new Text(familyMember.birthDate),
        trailing: new Text(familyMember.birthDate),
        onTap: _onTap,
      ),
    );
  }

  /*
  TODO Dialog for Editing a Family Member
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