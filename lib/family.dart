import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'familymember.dart';
import 'package:flutter_proto02/utils/theme.dart';
import 'package:flutter_proto02/utils/dateFormatter.dart';
import 'package:flutter_proto02/utils/ageCalculator.dart';
import 'addNewFM.dart'; //also includes FMSave
import 'editFM.dart';


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

    //SORT the family members by upcoming date so that they are in good order.
    _familyMembers.sort((a, b) => b.daysUntilNextBirthday.compareTo(a.daysUntilNextBirthday));


  }


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
          return new FamilyMemberWidget(familyMember: familyMember,
            idx: _familyMembers.indexOf(familyMember),
            callback: ((EditFMSave save, int idx) {
              if (save != null) {
                setState(() {
                  _familyMembers.elementAt(idx).name = save.name;
                  _familyMembers.elementAt(idx).birthDate = save.date;
                });
              } // else do nothing.

              //and always pop that info.
            }),
          );
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
  FamilyMemberWidget({Key key, this.familyMember, this.idx, this.callback}) : super(key: key);

  final FamilyMember familyMember;
  final int idx;
  final Function(EditFMSave, int idx) callback;

  @override
  FamilyMemberWidgetState createState() =>
      new FamilyMemberWidgetState(
        familyMember: familyMember,
        idx: idx,
        callback: callback,
      );
}

class FamilyMemberWidgetState extends State<FamilyMemberWidget> {
  FamilyMemberWidgetState({Key key, this.familyMember, this.idx, this.callback});

  final int idx;
  final FamilyMember familyMember;
  final Function(EditFMSave, int idx) callback;


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
        onTap: () {
          Navigator.push(context,
            new CupertinoPageRoute<EditFMSave>(
              builder: (BuildContext context) {
                return new EditEntryDialog(idx: idx, familyMember: familyMember,); //Will need to change name later as we go on.
              },
              //        maintainState: true,
              fullscreenDialog: true,
            )

          ).then((EditFMSave save) {
            if (save != null) {
              callback(save, idx);
            }

          });
        },
      ),
    );
  }
//
//  /*
//  TODO Dialog for Editing a Family Member
//   */
//  void _sayYes(int idx)  {
//    Navigator.pop(context); //close the edit dialog;
//
//    FMSave save = await Navigator.of(context).push(new CupertinoPageRoute<FMSave>(
//      builder: (BuildContext context) {
//        return new EditEntryDialog(idx); //Will need to change name later as we go on.
//      },
////        maintainState: true,
//      fullscreenDialog: true,
//    ));
//
//
//
//    if (save != null) {
//
////      _addFamilyMemberSave(save);
//    }
//    //
//  }
//
//  void _sayNo() {
//    Navigator.pop(context);
//  }
//
//  void _onTap(int idx) {
//    showDialog(
//      context: context,
//      child: new CupertinoAlertDialog(
//        title: new Text("Edit ${familyMember.name}?"),
//        content: new Text("Do you want to edit ${familyMember.name}'s\n name or birthdate?"),
//        actions: <Widget>[
//          new CupertinoDialogAction(
//            child: new Text("Cancel"),
//            onPressed: _sayNo,
//          ),
//          new CupertinoDialogAction(
//            child: new Text("Edit"),
//            isDefaultAction: true,
//            onPressed: () => {
//              Navigator.of(context).push(
//                new CupertinoPageRoute<FMSave>(
//                  builder: (BuildContext context) {
//                    return new EditEntryDialog(idx); //Will need to change name later as we go on.
//                  },
//            //        maintainState: true,
//                  fullscreenDialog: true,
//                ));
//            },
//          ),
//        ],
//      ),
//    );
//  }
}

