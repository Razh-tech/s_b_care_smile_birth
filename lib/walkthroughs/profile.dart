import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/pages/navbar/components/walkthrough/profile/profile_intro_walkthrough_component/profile_intro_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/profile/feature_walkthrough_component/feature_walkthrough_component_widget.dart';
import '/pages/navbar/components/walkthrough/profile/c_s_walkthrough_component/c_s_walkthrough_component_widget.dart';

// Focus widget keys for this walkthrough
final cardIsyiq0rm = GlobalKey();
final column5j9kbq6h = GlobalKey();
final column3mmjpv2n = GlobalKey();

/// Profile
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: cardIsyiq0rm,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => ProfileIntroWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: column5j9kbq6h,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => FeatureWalkthroughComponentWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: column3mmjpv2n,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => CSWalkthroughComponentWidget(),
          ),
        ],
      ),
    ];
