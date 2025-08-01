import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? convertDateStringToDateTime(String? dateString) {
  return DateTime.parse(dateString!);
}

List<int>? searchFunction(
  List<String>? list1,
  String? searchInput,
) {
  List<int> indexes = list1!
      .where((input) => input.contains(searchInput!))
      .map((input) => list1.indexOf(input))
      .toList();

  return indexes;
}

List<String>? searchListSameIndex(
  List<String>? list1,
  List<String>? list2,
  String? searchInput,
) {
  List<int> indexes = list1!
      .where((input) => input.contains(searchInput!))
      .map((input) => list1.indexOf(input))
      .toList();

  List<String> result = indexes.map((index) => list2![index]).toList();

  return result;
}

bool? checkPinCodeNum(String? pinCodeInput) {
  if (pinCodeInput!.length != 6) {
    return false;
  } else {
    if (int.tryParse(pinCodeInput!) != null) {
      return true;
    } else {
      return false;
    }
  }
}

int? containsInStringCopy(
  String? input,
  List<String>? customerName,
) {
  int result = 0;
  for (int i = 0; i < customerName!.length; i++) {
    if (customerName![i].toLowerCase().contains(input!.toLowerCase())) {
      result++;
    }
  }

  return result;
}

String? censoredPhoneNumber(String? phoneNumber) {
  String text = '';
  bool isNumber = false;

  if (double.tryParse(phoneNumber![9]) == null) {
    isNumber = false;
  } else {
    isNumber = true;
  }

  if (phoneNumber!.length == 10 && phoneNumber![0] == '0' && isNumber) {
    text =
        '${phoneNumber![0]}${phoneNumber![1]}${phoneNumber![2]}-${phoneNumber![3]}${phoneNumber![4]}${phoneNumber![5]}-XXXX';
  } else {
    text = 'เบอร์ไม่ถูกต้อง';
  }

  return text!;
}

String? countLeadType(
  String? leadType,
  List<String>? leadStatusList,
) {
  //int countLead = 0;

  //var elements = ["a", "b", "c", "d", "e", "a", "b", "c", "f", "g", "h", "h", "h", "e"];
  var map = leadStatusList!.fold<Map<String, int>>(
      {},
      (map, element) =>
          map..update(element, (value) => value + 1, ifAbsent: () => 1));
  //countLead = map[leadType!] ?? 0;
//print(map[leadType!]);
  return '${map[leadType!] ?? 0}';
}

String? calculateInProcessLead(
  String? contractLeadAmount,
  int? leadAmount,
) {
  int amount = leadAmount! - int.parse(contractLeadAmount!);

  return '$amount';
}

int leadTimeRemain(
  String? leadCreatedTimeText,
  DateTime? currentTime,
) {
  DateTime leadCreatedTime = DateTime.parse(leadCreatedTimeText!);

  DateTime leadFinalTime = leadCreatedTime.add(const Duration(days: 15));
  int leadTimeLeft = leadFinalTime.difference(currentTime!).inDays;

  return leadTimeLeft;
}

bool? containsInString(
  String? input,
  String? customerName,
) {
  if (input == '') {
    return true;
  } else if (customerName!.toLowerCase().contains(input!.toLowerCase())) {
    return true;
  } else {
    return false;
  }
}

String? findStatusIndex(
  List<String>? statusNameList,
  List<String>? statusIDList,
  String? statusName,
) {
  int index = statusNameList!.indexOf(statusName!);
  return statusIDList![index]!;
}

String? imgPathListToString(List<String>? imgPathList) {
  if (imgPathList == null) {
    return "";
  }
  String namesString = '';

  for (String name in imgPathList!) {
    namesString += name + ',';
  }

// Remove the last comma
  namesString = namesString.substring(0, namesString.length - 1);

  return namesString;
}

String? userLatitude(LatLng? currentLocation) {
  return '${currentLocation!.latitude}';
}

String? userLongitude(LatLng? currentLocation) {
  return '${currentLocation!.longitude}';
}

String? imgPathToString(String? imgPath) {
  return '$imgPath';
}

bool? textContainString(
  String? searchedText,
  String? fullText,
) {
  return fullText!.contains(searchedText!);
}

String? splitFirstString(
  String? object,
  String? spliting,
) {
  String symbol = '@';
  String result = object!.split('$symbol')[0];
  return result;
}
