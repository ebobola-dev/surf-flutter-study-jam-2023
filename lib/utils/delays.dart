import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:surf_flutter_study_jam_2023/config/config.dart';

//* Я не знал куда это засунуть...

class DelayUtil {
  static Future<void> fakeDelay() async {
    if (!Config.fakeDelay) return;
    if (kReleaseMode && !Config.fakeDelayInReleaseMode) return;
    log(
      'wait ${Config.fakeDelaySeconds} seconds... (You can remove it in lib/config/config.dart)',
      name: 'FAKE DELAY',
    );
    await Future.delayed(const Duration(seconds: Config.fakeDelaySeconds));
  }
}
