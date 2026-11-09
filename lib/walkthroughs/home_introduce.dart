import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/pages/navbar/components/walkthrough/home/prologue_walkthrough_component/prologue_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/s_b_pay_walkthrough_component/s_b_pay_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/appointment_walkthrough_component/appointment_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/default_provider_walkthrough_component/default_provider_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/e_learning_walkthrough_component/e_learning_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/online_class_schedule_walkthrough_component/online_class_schedule_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/online_class_service_walkthrough_component/online_class_service_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/s_b_care_licence_walkthrough_component/s_b_care_licence_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/transaction_history_walkthrough_component/transaction_history_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/home/contraction_timer_walkthrough_component/contraction_timer_walkthrough_component_widget.dart';

// Focus widget keys for this walkthrough
final cardK7ygrrus = GlobalKey();
final cardAg2xs8ki = GlobalKey();
final image094yyq21 = GlobalKey();
final imageXoz5j4tn = GlobalKey();
final imageFpd9g1s3 = GlobalKey();
final imageZ5ctxnz1 = GlobalKey();
final imageUc20meg7 = GlobalKey();
final imageHelkvi5y = GlobalKey();
final imageT9t6ihai = GlobalKey();

/// Home Introduce
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: cardK7ygrrus,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => PrologueWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: cardAg2xs8ki,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => SBPayWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: image094yyq21,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => AppointmentWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: imageXoz5j4tn,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) =>
                DefaultProviderWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: imageFpd9g1s3,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => ELearningWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: imageZ5ctxnz1,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) =>
                OnlineClassScheduleWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: imageZ5ctxnz1,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) =>
                OnlineClassServiceWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 8
      TargetFocus(
        keyTarget: imageUc20meg7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => SBCareLicenceWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 9
      TargetFocus(
        keyTarget: imageHelkvi5y,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) =>
                TransactionHistoryWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 10
      TargetFocus(
        keyTarget: imageT9t6ihai,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) =>
                ContractionTimerWalkthroughComponentWidget(),
          ),
        ],
      ),
    ];
