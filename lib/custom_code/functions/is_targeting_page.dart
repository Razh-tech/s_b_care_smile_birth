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

/// Returns true if the 'page' value in the link data matches the target.
///
/// Use this to check which screen the link intends to open. Ensure to include
/// 'page' in your link data while creating it in Branch.
bool isTargetingPage(
  dynamic linkDataJson,
  String targetPage,
) {
  if (linkDataJson is Map && linkDataJson.containsKey('page')) {
    final page = linkDataJson['page'];
    return page is String && page.toLowerCase() == targetPage.toLowerCase();
  }
  return false;
}
