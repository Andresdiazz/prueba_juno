import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:juno_prueba/model/daily.dart';
import 'package:juno_prueba/services/daily_services.dart';

class DailyProvider extends ChangeNotifier {
  late DailyService _dailyService;

  List<Result>? result;

  late StreamSubscription streamSubscription;

  DailyProvider() {
    _dailyService = Get.find<DailyService>();
    getDaily();
  }

  Future<List<Result>>? getDaily() async {
    if (result != null) {
      return result!;
    }
    result = await _dailyService.getDaily();

    notifyListeners();
    return result!;
  }

  Future<List<Result>>? refreshData() async {
    result = await _dailyService.getDaily();

    notifyListeners();
    return result!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamSubscription.cancel();
    super.dispose();
  }
}
