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

/// Generates a properties map for creating Branch smart links, including
/// metadata like channel, feature, campaign, stage, tags, alias, and custom
/// parameters.
///
/// Use this to organize and enrich links with analytics-friendly attributes
/// and control how links behave and appear.
dynamic createLinkProperties(
  String? channel,
  String? feature,
  String? campaign,
  String? stage,
  List<String>? tags,
  String? alias,
  int? matchDuration,
  dynamic customParams,
) {
// channel: Where the link is distributed (e.g. "email", "social", "web")
// feature: Feature in the app this link relates to (e.g. "invite", "share", "promo")
// campaign:	Marketing campaign name (e.g. "black_friday", "launch2025")
// stage: Funnel stage (e.g. "new_user", "checkout")
// tags:	List of tags to categorize this link (e.g. ["flutter", "beta"])
// alias:	Custom short URL suffix (e.g. yourapp.com/my-launch)
// matchDuration:	Time in milliseconds to match link to app open (e.g. 7200000 = 2hrs)
// customParams:	Any additional custom params (optional)

  final Map<String, String> result = {};

  if (channel != null) result['channel'] = channel;
  if (feature != null) result['feature'] = feature;
  if (campaign != null) result['campaign'] = campaign;
  if (stage != null) result['stage'] = stage;
  if (alias != null) result['alias'] = alias;
  if (matchDuration != null)
    result['match_duration'] = matchDuration.toString();

  // Optional: flatten tags into numbered keys (Branch SDK expects a list, so handle this upstream if needed)
  if (tags != null) {
    for (var i = 0; i < tags.length; i++) {
      result['tags[$i]'] = tags[i];
    }
  }

  // Merge in any custom user-defined key/values
  if (customParams != null) {
    customParams.forEach((key, value) {
      if (value != null) {
        result[key] = value.toString();
      }
    });
  }

  return result;
}
