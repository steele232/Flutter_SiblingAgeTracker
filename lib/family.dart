import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'familymember.dart';
import 'package:flutter_proto02/utils/theme.dart';
import 'package:flutter_proto02/utils/dateFormatter.dart';
import 'package:flutter_proto02/utils/ageCalculator.dart';
import 'addNewFM.dart'; //also includes FMSave


class FamilyMemberPage extends StatefulWidget {

  @override
  State createState() => new FamilyMemberPageState();
}

class FamilyMemberPageState extends State<FamilyMemberPage> {
  List<FamilyMember> _familyMembers = <FamilyMember>[];


  @override
  void initState() {

    _familyMembers = <FamilyMember> [
      new FamilyMember(
        "Jonathan",
        new DateTime(1995, 1, 5),
      ),
      new FamilyMember(
        "Sara",
        new DateTime(1997, 4, 29),
      ),
      new FamilyMember(
        "Stephanie",
        new DateTime(1997, 2, 1),
      ),
      new FamilyMember(
        "Spencer",
        new DateTime(1992, 7, 29),
      ),
      new FamilyMember(
        "Timothy",
        new DateTime(1992, 7, 29),
      ),
      new FamilyMember(
        "Austin",
        new DateTime(1992, 7, 29),
      ),
      new FamilyMember(
        "Elise",
        new DateTime(1988, 1, 16),
      ),
    ];

    //TODO SORT the family members by upcoming date so that they are in good order.
    //TODO Get the Date function working properly
//    _familyMembers.sort(((a, b) => {  ));
//    _familyMembers.sort((a, b) => a.name.compareTo(b.name));
    _familyMembers.sort((a, b) => a.birthDate.compareTo(b.birthDate));

  }


  //TODO: Create a dialog for Adding a family member..
  Future _showFullAddDialog() async {
    FMSave save = await Navigator.of(context).push(new CupertinoPageRoute<FMSave>(
        builder: (BuildContext context) {
          return new AddEntryDialog(); //Will need to change name later as we go on.
        },
//        maintainState: true,
        fullscreenDialog: true,
    ));



    if (save != null) {
      _addFamilyMemberSave(save);
    }
  }

  void _addFamilyMemberSave(FMSave save) {
    setState(() {
      _familyMembers.add(new FamilyMember(save.name, save.date));
    });
  }



  @override
  Widget build(BuildContext context) {

    //For now, let's make a hard copy of the familyMembers I want to see.
    //TODO Use Firebase or some other Data Service to populate the list



    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        backgroundColor: kIOSTheme.backgroundColor, // this is adjusted from 0xCCF8F8F8 to be opacity 1.0
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
            onPressed: _showFullAddDialog,
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

//  Widget _itemBuilder (BuildContext context, int index) {
//    FamilyMember familyMember = getFM(index);
//
//    return new FamilyMemberWidget(familyMember: familyMember);
//  }

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
    String birthdate = DateFormatter.formatUS(
        familyMember.birthDate.year,
        familyMember.birthDate.month,
        familyMember.birthDate.day
    );
    int age = AgeCalculator.calculateCurrentAge(
        familyMember.birthDate
    );
    return new Material(
      color: Colors.grey[80],
      type: MaterialType.transparency,
      child: new ListTile(
        leading: new CircleAvatar(child: new Text(familyMember.name.substring(0, 1)),),
        title: new Container(
            child: new Text(
              familyMember.name,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
        subtitle: new Text(
            birthdate,
        ),
        trailing: new Text(
          age.toString() + ' years old',
          style: new TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
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
  }
}

