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

bool verifyAppointment(String appointmentDate) {
  DateTime dateTime = DateFormat('dd MMMM yyyy').parse(appointmentDate);
  String formattedDate = DateFormat('yyyy-MM-dd 00:00:00').format(dateTime);
  // A condition to validate an action if an appointment date is less than or equal to two days away from current date
  // Get the current date and time
  DateTime currentDate = DateTime.now();

  // Add two days to the current date
  DateTime twoDaysAway = currentDate.add(Duration(days: 2));

  // Check if the appointment date is less than or equal to two days away from the current date
  if (DateTime.parse(formattedDate).isBefore(twoDaysAway) ||
      DateTime.parse(formattedDate).isAtSameMomentAs(twoDaysAway)) {
    // Perform the action
    return true;
  } else {
    // Do nothing
    return false;
  }
}
