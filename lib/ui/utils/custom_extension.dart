import 'package:flutter/material.dart';

extension CustomStringExtension on String? {
  String sentenceCapitalize() {
    if (this == null) {
      return "";
    }
    if (this!.split(" ").length > 1) {
      return this!
          .split(" ")
          .map((e) => e.capitalize())
          .toList()
          .toString()
          .replaceAll(",", "")
          .replaceAll("[", "")
          .replaceAll("]", "");
    } else {
      return "${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}";
    }
  }

  bool? setFocus(FocusNode focusNode) {
    if (!isNullOrEmpty()) {
      focusNode.requestFocus();
      return false;
    }
    return null;
  }

  String getName() {
    if (this == null) {
      return "";
    } else {
      final data = this?.split(" ");
      if (data == null) {
        return "User";
      } else if (data.length <= 1) {
        return "${this?.substring(0, 1).toUpperCase()}";
      } else {
        return data
            .fold(
                "",
                (previousValue, element) =>
                    previousValue + element.substring(0, 1))
            .toUpperCase()
            .replaceAll(" ", "")
            .replaceAll(",", "");
      }
    }
  }

  String capitalize() {
    if (this == null) {
      return "";
    }
    return "${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}";
  }

  String toDate() {
    if (isNullOrEmpty()) {
      return "";
    }
    if (DateTime.tryParse(this!) != null) {
      return this!;
    }

    ///When String Format is "May 28, 2023"
    List<String> commaSplit = this!.split(",");
    List<String> spaceSplit = commaSplit.first.split(" ");
    return "${commaSplit.last.trim()}${spaceSplit.first.trim().getMonthValue()}${spaceSplit.last.trim()}";
  }

  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    } else if (this!.trim().isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  String dateWithMName() {
    if (this != null) {
      DateTime? dateTime = DateTime.tryParse(this!);
      if (dateTime != null) {
        String date =
            "${dateTime.day} ${dateTime.month.getMonth()}, ${dateTime.year}";
        return date;
      }
    }
    return "";
  }

  String getMonthValue() {
    if (this == null) return "01";
    String value = this!.toLowerCase();
    switch (value) {
      case "january":
        return "01";
      case "february":
        return "02";
      case "march":
        return "03";
      case "april":
        return "04";
      case "may":
        return "05";
      case "june":
        return "06";
      case "july":
        return "07";
      case "august":
        return "08";
      case "september":
        return "09";
      case "october":
        return "10";
      case "november":
        return "11";
      case "december":
        return "12";
      default:
        return "01";
    }
  }

  bool isAfterCheck(DateTime dateTime) {
    if (this == null) {
      return false;
    } else {
      return DateTime.tryParse(this!)?.isAfter(dateTime) ?? false;
    }
  }

  bool isBeforeCheck(DateTime dateTime) {
    if (this == null) {
      return false;
    } else {
      return DateTime.tryParse(this!)?.isBefore(dateTime) ?? false;
    }
  }
}

extension CustomDateExtension on DateTime? {
  String toYYYYMMDD() {
    if (this != null) {
      return "${this!.year}-${this!.month >= 10 ? this!.month : "0${this!.month}"}-${this!.day >= 10 ? this!.day : "0${this!.day}"}";
    }
    return "";
  }

  String dateToMName() {
    if (this != null) {
      String date = "${this!.day.getDayOfMonthSuffix()} ${this!.month.getMonth()}, ${this!.year}";
      return date;
    }
    return "";
  }

  String? toDDMMYYYY() {
    if (this != null) {
      return "${this!.day >= 10 ? this!.day : "0${this!.day}"}/${this!.month >= 10 ? this!.month : "0${this!.month}"}/${this!.year}";
    }
    return null;
  }
}


extension CustomIntExtension on int {
  String twoDigit() {
    if (this >= 10) {
      return toString();
    } else {
      return '0$this';
    }
  }

  String getDayOfMonthSuffix() {
    if(!(this >= 1 && this <= 31)) {
      throw Exception('Invalid day of month');
    }

    if(this >= 11 && this <= 13) {
      return '${this}th';
    }

    switch(this % 10) {
      case 1: return '${this}st';
      case 2: return '${this}nd';
      case 3: return '${this}rd';
      default: return '${this}th';
    }
  }

  String getMonth() {
    switch (this) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }

  String getDay([bool short = false]) {
    switch (this) {
      case 1:
        return short ? "Mon" : "Monday";
      case 2:
        return short ? "Tue" : "Tuesday";
      case 3:
        return short ? "Wed" : "Wednesday";
      case 4:
        return short ? "Thu" : "Thursday";
      case 5:
        return short ? "Fri" : "Friday";
      case 6:
        return short ? "Sat" : "Saturday";
      case 7:
        return short ? "Sun" : "Sunday";
      default:
        return "";
    }
  }
}
