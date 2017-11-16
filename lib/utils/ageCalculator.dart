
class AgeCalculator {
  static int calculateCurrentAge(DateTime birthdate) {

    DateTime today = new DateTime.now();
    Duration difference = today.difference(birthdate);
    return (difference.inDays.toInt() / 365).toInt();
  }
}