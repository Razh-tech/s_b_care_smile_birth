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

List<dynamic> updateContractions(
  List<dynamic> contractionPerHour,
  int currentHour,
) {
  bool hourExists = false;

  List<dynamic> updatedList = contractionPerHour.map((item) {
    if (item["hour"] == currentHour) {
      hourExists = true;
      return {"hour": item["hour"], "contractions": item["contractions"] + 1};
    }
    return item;
  }).toList();

  if (!hourExists) {
    updatedList.add({"hour": currentHour, "contractions": 1});
  }

  return updatedList;
}
