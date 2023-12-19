import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lookup/features/common/overlays/overlay_banner.dart';

class OverlayHelper {
  static OverlayEntry? entry;

  static void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  static void showOverlay(BuildContext context, {PageRouteInfo? routePage}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (entry != null) {
        return;
      }
      entry = OverlayEntry(
        builder: (context) => OverlayBanner(
          onBannerDismissed: hideOverlay,
          routePage: routePage,
        ),
      );

      Overlay.of(context).insert(entry!);
    });
  }
}
