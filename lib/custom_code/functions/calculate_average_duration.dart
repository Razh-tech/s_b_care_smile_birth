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

String calculateAverageDuration(List<String> listDuration) {
  /// Pastikan listDuration tidak kosong
  if (listDuration.isEmpty) {
    return "00:00:00"; // Default jika list kosong
  }

  int totalSeconds = 0;

  // Menghitung total durasi dalam detik
  for (String duration in listDuration) {
    List<String> parts = duration.split(':');
    int hours = 0;
    int minutes = 0;
    int seconds = 0;

    // Menentukan jumlah bagian pada durasi (hh:mm:ss atau mm:ss)
    if (parts.length == 3) {
      hours = int.parse(parts[0]);
      minutes = int.parse(parts[1]);
      seconds = int.parse(parts[2]);
    } else if (parts.length == 2) {
      minutes = int.parse(parts[0]);
      seconds = int.parse(parts[1]);
    }

    totalSeconds += (hours * 3600) + (minutes * 60) + seconds;
  }

  // Menghitung rata-rata durasi dalam detik
  int averageSeconds = totalSeconds ~/ listDuration.length;

  // Mengkonversi rata-rata detik ke dalam format jam, menit, dan detik
  int hours = averageSeconds ~/ 3600;
  int remainingSeconds = averageSeconds % 3600;
  int minutes = remainingSeconds ~/ 60;
  int seconds = remainingSeconds % 60;

  // Fungsi untuk menambahkan padding jika kurang dari 2 digit
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  // Mengembalikan string dalam format "hh:mm:ss"
  return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
}
