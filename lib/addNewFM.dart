import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

//my own imports
import 'family.dart';
import 'familymember.dart';
import 'notifications.dart';
import 'package:flutter_proto02/utils/theme.dart';


var YEAR_MAX = new DateTime.now().year;
var YEAR_MIN = 1000;


class FMSave {
  FMSave(this.name, this.date);
  String name;
  DateTime date;
}

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {

  final TextEditingController _nameTextController = new TextEditingController();
  final TextEditingController _monthTextController = new TextEditingController();
  final TextEditingController _dayTextController = new TextEditingController();
  final TextEditingController _yearTextController = new TextEditingController();

  bool _hasError = false;

  bool _nameIsValid = true;
  bool _monthIsValid = true;
  bool _dayIsValid = true;
  bool _yearIsValid = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
          backgroundColor: kIOSTheme.backgroundColor,
          leading: new Material(
              child: new IconButton(
                icon: new Icon(Icons.clear),
                onPressed: (() {
                  Navigator.pop(context);
                })
              ),
          ),
          middle: new Text('Add Family Member',
            style: Theme.of(context).textTheme.subhead,
          ),
      ),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              new Container (
                padding: new EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                height: 350.0,
                child: new Column(
                  children: <Widget>[
                    new Text(
                      'Name',
                      textAlign: TextAlign.left,
                    ),
                    new Container(
                      color:
                        _nameIsValid ?
                          const Color(0x00000000) :
                          const Color(0xAFFF3B30),
                      padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      child: new TextField(
                        autocorrect: true,

                        controller: _nameTextController,

                        decoration: new InputDecoration(
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    new Text(
                      'Birth Date',
                      textAlign: TextAlign.left,
                    ),
                    new Row(
                      children: <Widget>[
                        new Expanded(

                          child: new Container(
                            color:
                              _monthIsValid ?
                                const Color(0x00000000) :
                                const Color(0xAFFF3B30),
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              controller: _monthTextController,
                              decoration: new InputDecoration(
                                hintText: 'MM',
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            color:
                              _dayIsValid ?
                                const Color(0x00000000) :
                                const Color(0xAFFF3B30),
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              controller: _dayTextController,
                              decoration: new InputDecoration(
                                hintText: 'DD',
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            color:
                              _yearIsValid ?
                                const Color(0x00000000) :
                                const Color(0xAFFF3B30),
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: new TextField(
                              controller: _yearTextController,
                              decoration: new InputDecoration(
                                hintText: 'YYYY',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              ),

              new Center(
                child: new Text(

                  _hasError ?
                      'Invalid date or name' :
                      'No Error', //should never see this

                  style: new TextStyle(
                    color:
                      _hasError ?
                        CupertinoColors.destructiveRed :
                        const Color(0x00000000),
                  ),



                ),
              ),

              new Center(
                child: new CupertinoButton(
                  child: new Text(
                    'Add Family Member',
                    style: new TextStyle(
//                      fontSize: 1.3,

                    ),
                  ),
                  onPressed: () {
                    //collect and put into a FMSave
                      //RELY ON THE STATE.

                    _nameIsValid = false;
                    _monthIsValid = false;
                    _dayIsValid = false;
                    _yearIsValid = false;

                    /*
                    Check the name
                     */
                    String nameString = _nameTextController.text;
                    if (
                      nameString.length > 0 &&
                      nameString.length < 64
                    ) {
                      _nameIsValid = true;
                    }

                    /*
                    Check the month
                     */
                    String monthString = _monthTextController.text;
                    int monthInt = 0;


                    //EXAMPLE:
                    //var value = int.parse(text, onError: (source) => null);

                    //check that it parses. else fail
                    monthInt = int.parse(monthString, onError: (source) => null);
                    //this last line will return null if

                    //check that it's between 1 and 12, else fail.
                    if (monthInt != null) { //
                      _monthIsValid = (
                        monthInt < 13 &&
                        monthInt > 0
                      );
                    }


                    /*
                    Check the year - Used for processing leapyears.
                     */
                    String yearString = _yearTextController.text;
                    int yearInt = int.parse(yearString, onError: (source) => null);

                    if (yearInt != null) {
                      _yearIsValid = (
                        yearInt < YEAR_MAX &&
                        yearInt > YEAR_MIN
                      );
                    }

                    /*
                    Check the day
                     */
                    String dayString = _dayTextController.text;
                    int dayInt = 0;
                    //check parsability
                    dayInt = int.parse(dayString, onError: (source) => null);
                    // returns null if fails

                    //check range
                    if (dayInt != null) {
                      // better handling.
                      int maxDay = 31;
                      if (monthInt != null && _monthIsValid) {
                        switch (monthInt)
                        {
                          case 1:
                          case 3:
                          case 5:
                          case 7:
                          case 8:
                          case 10:
                          case 12:
                            maxDay = 31;
                            break;
                          case 4:
                          case 6:
                          case 9:
                          case 11:
                            maxDay = 30;
                            break;
                          case 2:
                            //determine if it's a leapyear
                            //if the year is yet determinable from the year user input
                            if (monthInt != null &&
                                yearInt != null &&
                                _monthIsValid) {
                              if (yearInt % 4 == 0) {
                                maxDay = 29;
                              } else {
                                maxDay = 28;
                              }
                            } else {
                              maxDay = 28;
                            }
                            break;
                          default:
                            break;
                        }
                      }
                      _dayIsValid = (dayInt <= maxDay && dayInt > 0);
                    }

                    if (
                      _nameIsValid &&
                      _monthIsValid &&
                      _dayIsValid &&
                      _yearIsValid
                    ) {
                      //save and pop!
                      _hasError = false; // unnecessary, but whatever.

                      DateTime newBirthday = new DateTime(yearInt, monthInt, dayInt);

                      FMSave save = new FMSave(
                          _nameTextController.text,
                          newBirthday.toLocal(),
                      );

                      Navigator.of(context).pop(save);
                    } else {
                      setState(() {
                        //Error Feedback
                        _hasError = true;
                      });
                      //show User Valid Inputs
                    }
                  },
                )
              ),
            ]
        ),
      ),
    );
  }
}