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

String? getDeepLinkParam(
  dynamic linkDataJson,
  String paramKey,
) {
  if (linkDataJson is! Map) return null;

  // 1. Check if the ID is a standalone key (best practice) [cite: 18]
  if (linkDataJson.containsKey(paramKey)) {
    return linkDataJson[paramKey].toString();
  }

  // 2. Fallback: Parse it from the canonical identifier path [cite: 20]
  final String? path = linkDataJson['\$canonical_identifier']?.toString();
  if (path != null && path.contains('/')) {
    final segments = path.split('/').where((s) => s.isNotEmpty).toList();
    // If path is /article/123, the last segment is the ID
    if (segments.length > 1) return segments.last;
  }

  return null;
}
