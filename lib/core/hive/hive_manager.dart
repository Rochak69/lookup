import 'dart:io';

import 'package:hive/hive.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager instance = HiveManager._();

  Future<void> init() async {
    Hive.init(Directory.current.path);
    _registerAdapters();
    await _openBoxes();
  }

  void _registerAdapters() {
    // Hive
    //   ..registerAdapter(LogoAdapter())
  }

  Future<void> _openBoxes() async {
    // await Hive.openBox<ActiveWorkspacesResponse>(
    //   AppHiveBox.activeWorkspaceResponse,
    // );
  }

  Future<void> clearForLogout() async {
    try {
      // await Future.wait(
      //   [
      //     Hive.box<ActiveWorkspacesResponse>
      // (AppHiveBox.activeWorkspaceResponse)
      //         .clear(),
      //   ],
      // );
    } catch (e) {
      // debugPrint(e.toString());
    }
  }
}
