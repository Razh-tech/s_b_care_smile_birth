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

String translateToIndonesianDate(String inputDate) {
  // input example: Monday, 08 June 2026. expected output: Senin, 08 Juni 2026
  String result = inputDate;

  // 1. Map of English to Indonesian Days
  final Map<String, String> daysMap = {
    'Monday': 'Senin',
    'Tuesday': 'Selasa',
    'Wednesday': 'Rabu',
    'Thursday': 'Kamis',
    'Friday': 'Jumat',
    'Saturday': 'Sabtu',
    'Sunday': 'Minggu',
  };

  // 2. Map of English to Indonesian Months
  final Map<String, String> monthsMap = {
    'January': 'Januari',
    'February': 'Februari',
    'March': 'Maret',
    'April': 'April',
    'May': 'Mei',
    'June': 'Juni',
    'July': 'Juli',
    'August': 'Agustus',
    'September': 'September',
    'October': 'Oktober',
    'November': 'November',
    'December': 'Desember',
  };

  // 3. Swap the English Day out for Indonesian
  daysMap.forEach((englishDay, indonesianDay) {
    if (result.contains(englishDay)) {
      result = result.replaceAll(englishDay, indonesianDay);
    }
  });

  // 4. Swap the English Month out for Indonesian
  monthsMap.forEach((englishMonth, indonesianMonth) {
    if (result.contains(englishMonth)) {
      result = result.replaceAll(englishMonth, indonesianMonth);
    }
  });

  return result;
}
