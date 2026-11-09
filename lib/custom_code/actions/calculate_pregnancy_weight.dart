// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> calculatePregnancyWeight(
  String usiaKehamilan,
  double beratAwal,
  double beratSekarang,
) async {
  // Add your function code here!
  Map<String, Map<String, dynamic>> bmtData = {
    "08 - 09": {
      "bbJanin": 1,
      "tbJanin": 4.0,
      "kenaikanMin": 0.5,
      "kenaikanMax": 2.0
    },
    "09 - 10": {
      "bbJanin": 4,
      "tbJanin": 4.0,
      "kenaikanMin": 0.8,
      "kenaikanMax": 2.2
    },
    "10 - 11": {
      "bbJanin": 10,
      "tbJanin": 6.5,
      "kenaikanMin": 1.0,
      "kenaikanMax": 2.5
    },
    "11 - 12": {
      "bbJanin": 15,
      "tbJanin": 6.5,
      "kenaikanMin": 1.3,
      "kenaikanMax": 2.7
    },
    "12 - 13": {
      "bbJanin": 20,
      "tbJanin": 9.0,
      "kenaikanMin": 1.5,
      "kenaikanMax": 3.0
    },
    "13 - 14": {
      "bbJanin": 50,
      "tbJanin": 9.0,
      "kenaikanMin": 1.8,
      "kenaikanMax": 3.5
    },
    "14 - 15": {
      "bbJanin": 85,
      "tbJanin": 12.5,
      "kenaikanMin": 2.15,
      "kenaikanMax": 3.85
    },
    "15 - 16": {
      "bbJanin": 100,
      "tbJanin": 12.5,
      "kenaikanMin": 2.5,
      "kenaikanMax": 4.3
    },
    "16 - 17": {
      "bbJanin": 110,
      "tbJanin": 16.0,
      "kenaikanMin": 2.85,
      "kenaikanMax": 4.8
    },
    "17 - 18": {
      "bbJanin": 180,
      "tbJanin": 16.0,
      "kenaikanMin": 3.2,
      "kenaikanMax": 5.3
    },
    "18 - 19": {
      "bbJanin": 210,
      "tbJanin": 20.5,
      "kenaikanMin": 3.55,
      "kenaikanMax": 5.8
    },
    "19 - 20": {
      "bbJanin": 300,
      "tbJanin": 20.5,
      "kenaikanMin": 3.9,
      "kenaikanMax": 6.3
    },
    "20 - 21": {
      "bbJanin": 325,
      "tbJanin": 25.0,
      "kenaikanMin": 4.25,
      "kenaikanMax": 6.8
    },
    "21 - 22": {
      "bbJanin": 360,
      "tbJanin": 25.0,
      "kenaikanMin": 4.6,
      "kenaikanMax": 7.3
    },
    "22 - 23": {
      "bbJanin": 400,
      "tbJanin": 27.5,
      "kenaikanMin": 4.95,
      "kenaikanMax": 7.8
    },
    "23 - 24": {
      "bbJanin": 450,
      "tbJanin": 27.5,
      "kenaikanMin": 5.3,
      "kenaikanMax": 8.3
    },
    "24 - 25": {
      "bbJanin": 500,
      "tbJanin": 30.0,
      "kenaikanMin": 5.65,
      "kenaikanMax": 8.8
    },
    "25 - 26": {
      "bbJanin": 600,
      "tbJanin": 30.0,
      "kenaikanMin": 6.0,
      "kenaikanMax": 9.3
    },
    "26 - 27": {
      "bbJanin": 700,
      "tbJanin": 32.5,
      "kenaikanMin": 6.35,
      "kenaikanMax": 9.8
    },
    "27 - 28": {
      "bbJanin": 800,
      "tbJanin": 32.5,
      "kenaikanMin": 6.7,
      "kenaikanMax": 10.3
    },
    "28 - 29": {
      "bbJanin": 900,
      "tbJanin": 35.0,
      "kenaikanMin": 6.95,
      "kenaikanMax": 10.55
    },
    "29 - 30": {
      "bbJanin": 1000,
      "tbJanin": 35.0,
      "kenaikanMin": 7.2,
      "kenaikanMax": 10.8
    },
    "30 - 31": {
      "bbJanin": 1100,
      "tbJanin": 37.5,
      "kenaikanMin": 7.45,
      "kenaikanMax": 11.05
    },
    "31 - 32": {
      "bbJanin": 1200,
      "tbJanin": 37.5,
      "kenaikanMin": 7.7,
      "kenaikanMax": 11.3
    },
    "32 - 33": {
      "bbJanin": 1300,
      "tbJanin": 40.0,
      "kenaikanMin": 7.95,
      "kenaikanMax": 11.55
    },
    "33 - 34": {
      "bbJanin": 1400,
      "tbJanin": 40.0,
      "kenaikanMin": 8.2,
      "kenaikanMax": 11.8
    },
    "34 - 35": {
      "bbJanin": 1500,
      "tbJanin": 42.5,
      "kenaikanMin": 8.45,
      "kenaikanMax": 12.05
    },
    "35 - 36": {
      "bbJanin": 2000,
      "tbJanin": 42.5,
      "kenaikanMin": 8.7,
      "kenaikanMax": 12.3
    },
    "36 - 37": {
      "bbJanin": 2400,
      "tbJanin": 45.0,
      "kenaikanMin": 8.95,
      "kenaikanMax": 12.55
    },
    "37 - 38": {
      "bbJanin": 2700,
      "tbJanin": 45.0,
      "kenaikanMin": 9.2,
      "kenaikanMax": 12.8
    },
    "38 - 39": {
      "bbJanin": 2900,
      "tbJanin": 47.5,
      "kenaikanMin": 9.45,
      "kenaikanMax": 13.05
    },
    "39 - 40": {
      "bbJanin": 3100,
      "tbJanin": 47.5,
      "kenaikanMin": 9.7,
      "kenaikanMax": 13.3
    },
    "40 - 41": {
      "bbJanin": 3300,
      "tbJanin": 50.0,
      "kenaikanMin": 9.95,
      "kenaikanMax": 13.55
    },
    "41 - 42": {
      "bbJanin": 3400,
      "tbJanin": 50.0,
      "kenaikanMin": 10.2,
      "kenaikanMax": 13.8
    },
  };

  final data = bmtData[usiaKehamilan];

  if (data == null) {
    return ["Invalid gestational age", 0.0, 0.0, 0.0, 0.0];
  }

  double bbJanin = data["bbJanin"] ?? 0.0;
  double tbJanin = data["tbJanin"] ?? 0.0;
  double kenaikanMin = data["kenaikanMin"] ?? 0.0;
  double kenaikanMax = data["kenaikanMax"] ?? 0.0;

  double bbIdealMin = beratAwal + kenaikanMin;
  double bbIdealMax = beratAwal + kenaikanMax;
  String pertambahanBB =
      "${kenaikanMin.toStringAsFixed(1)} – ${kenaikanMax.toStringAsFixed(1)}";
  String bbIdeal =
      "${bbIdealMin.toStringAsFixed(1)} – ${bbIdealMax.toStringAsFixed(1)}";

  String hasil = "Normal";

  if (beratSekarang < bbIdealMin) {
    hasil = "Underweight";
  } else if (beratSekarang > bbIdealMax) {
    hasil = "Overweight";
  }

  return [hasil, bbJanin, tbJanin, pertambahanBB, bbIdeal];
}
