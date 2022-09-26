import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/api.dart';
import '../model/daily.dart';

class DailyService {
  Future<List<Result>> getDaily() async {
    final response = await http.get(Uri.parse(API.apiUrl));
    if (response.statusCode == 200) {
      List decoded = await jsonDecode(response.body);
      return decoded.map((result) => Result.fromJson(result)).toList();
    }

    return [];
  }
}
