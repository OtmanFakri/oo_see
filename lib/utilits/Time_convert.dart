import 'package:time/time.dart';
import 'dart:core';
String formatTime(int seconds) {
  return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
}