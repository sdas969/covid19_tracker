import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final defaultBorderRadius = BorderRadius.circular(20);
final cardShape = RoundedRectangleBorder(borderRadius: defaultBorderRadius);
const String appTitle = 'COVID-19 Tracker';
const appDragDevices = {
  PointerDeviceKind.mouse,
  PointerDeviceKind.touch,
  PointerDeviceKind.stylus,
  PointerDeviceKind.unknown
};
final appScrollBehaviour = const MaterialScrollBehavior().copyWith(
    dragDevices: appDragDevices, physics: const BouncingScrollPhysics());
bool renderLottieCheck() => (kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS));
