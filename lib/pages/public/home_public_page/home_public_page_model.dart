import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_public_page_widget.dart' show HomePublicPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePublicPageModel extends FlutterFlowModel<HomePublicPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ArticleCarousel widget.
  CarouselSliderController? articleCarouselController;
  int articleCarouselCurrentIndex = 0;

  // State field(s) for AdsCarousel widget.
  CarouselSliderController? adsCarouselController;
  int adsCarouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
