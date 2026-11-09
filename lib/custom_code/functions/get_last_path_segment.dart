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

/// Extracts the last segment of a URI path (e.g.
///
/// a document ID or any ID) from a link URL.
String? getLastPathSegment(String? link) {
  if (link == null || link.isEmpty) return null;
  try {
    final uri = Uri.parse(link);
    final segments = uri.pathSegments;
    return segments.isNotEmpty ? segments.last : null;
  } catch (_) {
    return null;
  }
}
