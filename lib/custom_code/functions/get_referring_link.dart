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

/// Retrieve the full original Branch URL from the link data.
///
/// Provide the linkData as the input parameter.
String? getReferringLink(dynamic linkDataJson) {
  if (linkDataJson != null &&
      linkDataJson is Map &&
      linkDataJson.containsKey('~referring_link')) {
    final link = linkDataJson['~referring_link'];
    if (link is String) return link;
  }
  return null;
}
