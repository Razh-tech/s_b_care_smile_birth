import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'home_navbar_widget.dart' show HomeNavbarWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeNavbarModel extends FlutterFlowModel<HomeNavbarWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homeIntroduceController;
  // Stores action output result for [Backend Call - API (Get User Profile)] action in HomeNavbar widget.
  ApiCallResponse? getUserProfileResult;
  // Stores action output result for [Backend Call - API (Get Home Address)] action in HomeNavbar widget.
  ApiCallResponse? getHomeAddressCounty;
  // Stores action output result for [Backend Call - API (Get Info Mitra)] action in HomeNavbar widget.
  ApiCallResponse? getInfoMitra;
  // Stores action output result for [Backend Call - API (Get Owned List Contraction Pro)] action in HomeNavbar widget.
  ApiCallResponse? countTotalOwnedContractionPro;
  // Stores action output result for [Backend Call - API (Get User Wallet)] action in HomeNavbar widget.
  ApiCallResponse? getUserWallet;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Custom Action - getOneSignalSubscriptionId] action in HomeNavbar widget.
  String? getSubscriptionIdResult;
  // Stores action output result for [Custom Action - getDeviceID] action in HomeNavbar widget.
  String? getDeviceIdResult;
  // Stores action output result for [Custom Action - getDeviceInfo] action in HomeNavbar widget.
  String? getDeviceInfoResult;
  // Stores action output result for [Backend Call - API (Register User Device)] action in HomeNavbar widget.
  ApiCallResponse? registerDeviceResult;
  // Stores action output result for [Backend Call - API (Get Home Address)] action in HomeNavbar widget.
  ApiCallResponse? getHomeAddressDetails;
  // Stores action output result for [Backend Call - API (Get Info Mitra)] action in HomeNavbar widget.
  ApiCallResponse? getMitraInfo;
  // Stores action output result for [Backend Call - API (Get Owned List Contraction Pro)] action in HomeNavbar widget.
  ApiCallResponse? countTotalOwnedContractionPro2;
  // Stores action output result for [Backend Call - API (Get User Wallet)] action in HomeNavbar widget.
  ApiCallResponse? getUserWallet2;
  // Stores action output result for [Custom Action - getOneSignalSubscriptionId] action in HomeNavbar widget.
  String? getSubscriptionIdResult2;
  // Stores action output result for [Custom Action - getDeviceID] action in HomeNavbar widget.
  String? getDeviceIdResult2;
  // Stores action output result for [Custom Action - getDeviceInfo] action in HomeNavbar widget.
  String? getDeviceInfoResult2;
  // Stores action output result for [Backend Call - API (Register User Device)] action in HomeNavbar widget.
  ApiCallResponse? registerDeviceResult2;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in HomeNavbar widget.
  ApiCallResponse? getRefreshToken;
  // Stores action output result for [Custom Action - getOneSignalSubscriptionId] action in HomeNavbar widget.
  String? getSubscriptionIdResult3;
  // Stores action output result for [Custom Action - getDeviceID] action in HomeNavbar widget.
  String? getDeviceIdResult3;
  // Stores action output result for [Custom Action - getDeviceInfo] action in HomeNavbar widget.
  String? getDeviceInfoResult3;
  // Stores action output result for [Backend Call - API (Register User Device)] action in HomeNavbar widget.
  ApiCallResponse? registerDeviceResult3;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (Update Default Provider)] action in ResetIcon widget.
  ApiCallResponse? resetDefaultProvider;
  // State field(s) for ArticleCarousel widget.
  CarouselSliderController? articleCarouselController1;
  int articleCarouselCurrentIndex1 = 0;

  // State field(s) for ArticleCarousel widget.
  CarouselSliderController? articleCarouselController2;
  int articleCarouselCurrentIndex2 = 0;

  // State field(s) for AdsCarousel widget.
  CarouselSliderController? adsCarouselController;
  int adsCarouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    homeIntroduceController?.finish();
    columnController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
