import 'package:flutter/material.dart';
import 'package:lookup/features/common/overlays/overlay_banner.dart';

class OverlayHelper {
  static OverlayEntry? entry;

  static void displayOverlay(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay(context));
  }

  static void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  static void showOverlay(BuildContext context) {
    entry = OverlayEntry(
      builder: (context) => const OverlayBanner(
        onBannerDismissed: hideOverlay,
      ),
    );

    Overlay.of(context).insert(entry!);
  }
}
