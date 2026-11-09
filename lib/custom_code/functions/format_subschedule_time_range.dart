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

String formatSubscheduleTimeRange(
  dynamic apiResult,
  int idSubschedule,
) {
// 1. Safety check for null or structural issues
  if (apiResult == null ||
      apiResult['data'] == null ||
      apiResult['data']['schedules'] == null) {
    return 'No data available';
  }

  final schedules = apiResult['data']['schedules'] as List<dynamic>;
  Map<String, dynamic>? targetSubschedule;
  String timezone = 'WIB'; // Default fallback

  // 2. Deep search through schedules and sub_schedules to find the ID
  for (var schedule in schedules) {
    if (schedule['sub_schedules'] != null) {
      final subSchedules = schedule['sub_schedules'] as List<dynamic>;
      for (var sub in subSchedules) {
        if (sub['id_subschedule'] == idSubschedule) {
          targetSubschedule = sub as Map<String, dynamic>;
          // Dynamically grab the timezone from the parent schedule if it exists
          if (schedule['schedule_timezone'] != null) {
            timezone = schedule['schedule_timezone'].toString();
          }
          break;
        }
      }
    }
    if (targetSubschedule != null) break;
  }

  // 3. Handle if the App State ID doesn't match anything in the API response
  if (targetSubschedule == null) {
    return 'Schedule not found';
  }

  // 4. Extract start and end time strings
  String startStr = targetSubschedule['subschedule_started'] ?? '';
  String endStr = targetSubschedule['subschedule_end'] ?? '';

  if (startStr.isEmpty || endStr.isEmpty) {
    return 'Missing time data';
  }

  // 5. Clean up the formatting (e.g., converts "13.00" to "13:00")
  startStr = startStr.replaceAll('.', ':');
  endStr = endStr.replaceAll('.', ':');

  // 6. Ensure double-digit padding if the API gives "8:00" instead of "08:00"
  if (startStr.contains(':') && startStr.indexOf(':') == 1) {
    startStr = '0$startStr';
  }
  if (endStr.contains(':') && endStr.indexOf(':') == 1) {
    endStr = '0$endStr';
  }

  // 7. Return the combined custom range string
  return '$startStr - $endStr $timezone';
}
