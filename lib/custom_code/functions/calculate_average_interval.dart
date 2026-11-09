import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/custom_auth/auth_util.dart';

String calculateAverageInterval(
  List<String> startTimes,
  List<String> endTimes,
) {
  int totalSeconds = 0;

  for (int i = 1; i < startTimes.length; i++) {
    DateTime prevEnd = DateTime.parse('2024-01-01 ' + endTimes[i - 1]);
    DateTime currentStart = DateTime.parse('2024-01-01 ' + startTimes[i]);
    totalSeconds += currentStart.difference(prevEnd).inSeconds;
  }

  int averageSeconds = totalSeconds ~/ (startTimes.length - 1);
  int minutes = averageSeconds ~/ 60;
  int seconds = averageSeconds % 60;

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  return "${twoDigits(minutes)}:${twoDigits(seconds)}";
}
