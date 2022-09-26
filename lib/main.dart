import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juno_prueba/services/daily_services.dart';

import 'src/myapp.dart';

void main() {
  Get.put<DailyService>(DailyService());
  runApp(const MyApp());
}
