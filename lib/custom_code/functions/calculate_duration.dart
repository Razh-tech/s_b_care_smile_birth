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

String calculateDuration(
  String startTime,
  String endTime,
) {
  DateTime start = DateTime.parse('2024-01-01 ' + startTime);
  DateTime end = DateTime.parse('2024-01-01 ' + endTime);
  Duration difference = end.difference(start);

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  return "${twoDigits(difference.inMinutes)}:${twoDigits(difference.inSeconds.remainder(60))}";
}
