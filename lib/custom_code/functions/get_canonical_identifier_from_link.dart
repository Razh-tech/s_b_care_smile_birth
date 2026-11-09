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

/// Retrieves the original route path (e.g.
///
/// /page/:id) attached to the Branch link.
String? getCanonicalIdentifierFromLink(dynamic linkDataJson) {
  if (linkDataJson is Map &&
      linkDataJson.containsKey('\$canonical_identifier')) {
    final id = linkDataJson['\$canonical_identifier'];
    if (id is String) return id;
  }
  return null;
}
