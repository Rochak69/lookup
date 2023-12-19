import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:lookup/core/hive/app_hive_box.dart';
// ignore: unused_import
import 'package:lookup/features/homepage/data/feed_list.dart';
import 'package:lookup/features/video_page/data/model/like_share_count_model.dart';
import 'package:lookup/features/video_page/domain/entity/feed_video_entity.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager instance = HiveManager._();

  Future<void> init() async {
    await Hive.initFlutter();

    _registerAdapters();
    await _openBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(LikeShareEntityAdapter());
  }

  Future<void> _openBoxes() async {
    await Hive.openBox<LikeShareCount?>(
      AppHiveBox.likeShareCount,
    );
  }

  Future<void> clearForLogout() async {
    try {
      await Future.wait(
        [
          Hive.box<LikeShareCount?>(AppHiveBox.likeShareCount).clear(),
        ],
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
