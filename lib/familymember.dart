import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class FamilyMember {

  FamilyMember(name, birthDate) {

    this.name = name;
    this.birthDate = birthDate;
    //calculate the daysUntil right from the beginning.
    DateTime today = new DateTime.now();


    //GENERALLY
    //if it's less than a year, break
    //else reset the today variable's year one down.
    while (true) {
      int differenceInt = today.difference(this.birthDate).inDays;
      // if I should be checking a leapyear..
      if (today.month > 2) { //I need to check today's year if it's a leapyear
        if (isLeapYear(today.year)) {
          if (differenceInt >= 366) {
            today = new DateTime(today.year - 1, today.month, today.day);
          } else { // we've deduced that we are within the year mark so we can kick out
            break;
          }
        } else {
          if (differenceInt >= 365) {
            today = new DateTime(today.year - 1, today.month, today.day);
          } else { // we've deduced that we are within the year mark so we can kick out
            break;
          }
        }
      } else { // I need to check the year below today's
        if (isLeapYear(today.year - 1)) {
          if (differenceInt >= 366) {
            today = new DateTime(today.year - 1, today.month, today.day);
          } else { // we've deduced that we are within the year mark so we can kick out
            break;
          }
        } else {
          if (differenceInt >= 365) {
            today = new DateTime(today.year - 1, today.month, today.day);
          } else { // we've deduced that we are within the year mark so we can kick out
            break;
          }

        }
      }
    }
    //now let's define the daysUntilNextBirthday
    daysUntilNextBirthday = today.difference(this.birthDate).inDays;

  }

  String name;
  DateTime birthDate;
  int daysUntilNextBirthday;

  bool isLeapYear(int year) {
    return (year % 4 == 0);
  }

}