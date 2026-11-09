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

String convertToIndonesianDateString(String dateString) {
  if (dateString.isEmpty) {
    return '';
  }

  try {
    // 1. Clean the string and split it by the hyphen (-)
    List<String> parts = dateString.trim().split('-');

    // Safely verify we have Year, Month, and Day components
    if (parts.length != 3) {
      return 'Format Tanggal Salah';
    }

    // 2. Parse components safely as integers
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int dayOfMonth = int.parse(parts[2]);

    // 3. Create the DateTime object using standard integer values
    DateTime parsedDate = DateTime(year, month, dayOfMonth);

    // 4. Explicit Translation Maps
    final List<String> days = [
      'Senin', // Monday
      'Selasa', // Tuesday
      'Rabu', // Wednesday
      'Kamis', // Thursday
      'Jumat', // Friday
      'Sabtu', // Saturday
      'Minggu' // Sunday
    ];

    final List<String> months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    // 5. Extract components (DateTime.weekday returns 1 for Monday, 7 for Sunday)
    String dayName = days[parsedDate.weekday - 1];
    String monthName = months[month - 1];

    // 6. Assemble exact format: "Senin, 25 Mei 2026"
    return '$dayName, $dayOfMonth $monthName $year';
  } catch (e) {
    return 'Format Tanggal Salah';
  }
}
