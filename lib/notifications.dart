import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_proto02/utils/theme.dart';


class NotificationsPage extends StatefulWidget {

  @override
  State createState() => new NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {

  bool _birthdayIsOn;
  bool _dayOf;
  bool _dayBefore1;
  bool _dayBefore2;
//  bool _dayBefore3;
  bool _wkBefore1;
  bool _wkBefore2;
  bool _monthBefore1;
  bool _monthBefore2;

  @override
  void initState() {
    _birthdayIsOn = false;
    _dayOf = false;
    _dayBefore1 = false;
    _dayBefore2 = false;
    _wkBefore1 = false;
    _wkBefore2 = false;
    _monthBefore1 = false;
    _monthBefore2 = false;

  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        backgroundColor: kIOSTheme.backgroundColor, // opacity corrected for proper behavior
        middle: new Text(
            'Notifications',
            style: Theme.of(context).textTheme.subhead,
            textDirection: TextDirection.ltr,
        ),
      ),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          children: <Widget>[
            new ListTile(
              subtitle: new Text(
                'Birthday Notifications',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black,
                ),
              ),
              trailing: new CupertinoSwitch(value: _birthdayIsOn, onChanged: (bool value) {
                setState(() {
                  _birthdayIsOn = value;
                });
              }),
            ),
            new Divider(height: 20.0),
            new Expanded(
              child: new Column(
                children: <Widget>[
                  new Expanded(
                    child: new ListTile(
                      enabled: _birthdayIsOn,
                      subtitle:
                        _birthdayIsOn ?
                          new Text(
                            'Day Of Birthday',
                            style: new TextStyle(
                              color: CupertinoColors.black
                            ),
                          ) :
                          new Text(
                              'Day Of Birthday'
                          ),
                      trailing: new CupertinoSwitch(
                        value: _dayOf,
                        activeColor:
                          _birthdayIsOn ?
                            CupertinoColors.activeGreen
                              :
                            CupertinoColors.inactiveGray,
                        onChanged: (bool value) {
                          if (_birthdayIsOn) {
                            setState(() {
                              _dayOf = value;
                            });
                          }
                        }
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(
                      enabled: _birthdayIsOn,
                      subtitle:
                        _birthdayIsOn ?
                          new Text(
                            '1 Day Before',
                            style: new TextStyle(
                              color: CupertinoColors.black
                            ),
                          ) :
                          new Text(
                              '1 Day Before'
                          ),
                      trailing: new CupertinoSwitch(
                        value: _dayBefore1,
                        activeColor:
                          _birthdayIsOn ?
                            CupertinoColors.activeGreen
                              :
                            CupertinoColors.inactiveGray,
                        onChanged: (bool value) {
                          if (_birthdayIsOn) {
                            setState(() {
                              _dayBefore1 = value;
                            });
                          }
                        }
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(
                      enabled: _birthdayIsOn,
                      subtitle:
                        _birthdayIsOn ?
                          new Text(
                            '2 Day Before',
                            style: new TextStyle(
                              color: CupertinoColors.black
                            ),
                          ) :
                          new Text(
                              '2 Day Before'
                          ),
                      trailing: new CupertinoSwitch(
                        value: _dayBefore2,
                        activeColor:
                          _birthdayIsOn ?
                            CupertinoColors.activeGreen
                              :
                            CupertinoColors.inactiveGray,
                        onChanged: (bool value) {
                          if (_birthdayIsOn) {
                            setState(() {
                              _dayBefore2 = value;
                            });
                          }
                        }
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(
                      enabled: _birthdayIsOn,
                      subtitle:
                        _birthdayIsOn ?
                          new Text(
                            '1 Week Before',
                            style: new TextStyle(
                              color: CupertinoColors.black
                            ),
                          ) :
                          new Text(
                              '1 Week Before'
                          ),
                      trailing: new CupertinoSwitch(
                        value: _wkBefore1,
                        activeColor:
                          _birthdayIsOn ?
                            CupertinoColors.activeGreen
                              :
                            CupertinoColors.inactiveGray,
                        onChanged: (bool value) {
                          if (_birthdayIsOn) {
                            setState(() {
                              _wkBefore1 = value;
                            });
                          }
                        }
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(
                      enabled: _birthdayIsOn,
                      subtitle:
                        _birthdayIsOn ?
                          new Text(
                            '2 Weeks Before',
                            style: new TextStyle(
                              color: CupertinoColors.black
                            ),
                          ) :
                          new Text(
                              '2 Weeks Before'
                          ),
                      trailing: new CupertinoSwitch(
                        value: _wkBefore2,
                        activeColor:
                          _birthdayIsOn ?
                            CupertinoColors.activeGreen
                              :
                            CupertinoColors.inactiveGray,
                        onChanged: (bool value) {
                          if (_birthdayIsOn) {
                            setState(() {
                              _wkBefore2 = value;
                            });
                          }
                        }
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(
                      enabled: _birthdayIsOn,
                      subtitle:
                        _birthdayIsOn ?
                          new Text(
                            '1 Month Before',
                            style: new TextStyle(
                              color: CupertinoColors.black
                            ),
                          ) :
                          new Text(
                              '1 Month Before'
                          ),
                      trailing: new CupertinoSwitch(
                        value: _monthBefore1,
                        activeColor:
                          _birthdayIsOn ?
                            CupertinoColors.activeGreen
                              :
                            CupertinoColors.inactiveGray,
                        onChanged: (bool value) {
                          if (_birthdayIsOn) {
                            setState(() {
                              _monthBefore1 = value;
                            });
                          }
                        }
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new ListTile(
                      enabled: _birthdayIsOn,
                      subtitle:
                        _birthdayIsOn ?
                          new Text(
                            '2 Months Before',
                            style: new TextStyle(
                              color: CupertinoColors.black
                            ),
                          ) :
                          new Text(
                              '2 Months Before'
                          ),
                      trailing: new CupertinoSwitch(
                        value: _monthBefore2,
                        activeColor:
                          _birthdayIsOn ?
                            CupertinoColors.activeGreen
                              :
                            CupertinoColors.inactiveGray,
                        onChanged: (bool value) {
                          if (_birthdayIsOn) {
                            setState(() {
                              _monthBefore2 = value;
                            });
                          }
                        }
                      ),
                    ),
                  ),













//
//                  new Expanded(
//                    child: new ListTile(
//                      subtitle: new Text('Day Of Birthday'),
//                      trailing: new CupertinoSwitch(value: _dayOf, onChanged: (bool value) {
//                        setState(() {
//                          _dayOf = value;
//                        });
//                      }),
//                    ),
//                  ),
//                  new Expanded(
//                    child: new ListTile(
//                      subtitle: new Text('1 Day Before'),
//                      trailing: new CupertinoSwitch(value: _dayBefore1, onChanged: (bool value) {
//                        setState(() {
//                          _dayBefore1 = value;
//                        });
//                      }),
//                    ),
//                  ),
//                  new Expanded(
//                    child: new ListTile(
//                      subtitle: new Text('2 Days Before'),
//                      trailing: new CupertinoSwitch(value: _dayBefore2, onChanged: (bool value) {
//                        setState(() {
//                          _dayBefore2 = value;
//                        });
//                      }),
//                    ),
//                  ),
//                  new Expanded(
//                    child: new ListTile(
//                      subtitle: new Text('1 Week Before'),
//                      trailing: new CupertinoSwitch(value: _wkBefore1, onChanged: (bool value) {
//                        setState(() {
//                          _wkBefore1 = value;
//                        });
//                      }),
//                    ),
//                  ),
//                  new Expanded(
//                    child: new ListTile(
//                      subtitle: new Text('2 Weeks Before'),
//                      trailing: new CupertinoSwitch(value: _wkBefore2, onChanged: (bool value) {
//                        setState(() {
//                          _wkBefore2 = value;
//                        });
//                      }),
//                    ),
//                  ),
//                  new Expanded(
//                    child: new ListTile(
//                      subtitle: new Text('1 Month Before'),
//                      trailing: new CupertinoSwitch(value: _monthBefore1, onChanged: (bool value) {
//                        setState(() {
//                          _monthBefore1 = value;
//                        });
//                      }),
//                    ),
//                  ),
//                  new Expanded(
//                    child: new ListTile(
//                      subtitle: new Text('2 Months Before'),
//                      trailing: new CupertinoSwitch(value: _monthBefore2, onChanged: (bool value) {
//                        setState(() {
//                          _monthBefore2 = value;
//                        });
//                      }),
//                    ),
//                  ),
                  new Expanded(
                    child: new Divider(height: 20.0),
                  )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}