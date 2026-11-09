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

bool bookingAppointment(String appointmentDate) {
  DateTime dateTime = DateFormat('dd MM yyyy').parse(appointmentDate);
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

  // A condition to validate an action if an appointment date is more than or equal to current date
  DateTime currentDate = DateTime.now();
  String formattedCurrentDate = DateFormat('yyyy-MM-dd').format(currentDate);

  // Check if the appointment date is more than or equal to current date
  if (DateTime.parse(formattedDate).isAfter(currentDate) ||
      DateTime.parse(formattedDate)
          .isAtSameMomentAs(DateTime.parse(formattedCurrentDate))) {
    return true;
  } else {
    return false;
  }
}
