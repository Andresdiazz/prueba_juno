// To parse this JSON data, do
//
//     final daily = dailyFromJson(jsonString);

import 'dart:convert';

Daily dailyFromJson(String str) => Daily.fromJson(json.decode(str));

String dailyToJson(Daily data) => json.encode(data.toJson());

class Daily {
  Daily({
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.results,
  });

  int queryCount;
  int resultsCount;
  bool adjusted;
  List<Result> results;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.t,
    required this.v,
    required this.vw,
    required this.o,
    required this.c,
    required this.h,
    required this.l,
    required this.resultT,
    required this.n,
  });

  String t;
  int v;
  double vw;
  double o;
  double c;
  double h;
  double l;
  int resultT;
  int n;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        t: json["T"],
        v: json["v"],
        vw: json["vw"].toDouble(),
        o: json["o"].toDouble(),
        c: json["c"].toDouble(),
        h: json["h"].toDouble(),
        l: json["l"].toDouble(),
        resultT: json["t"],
        n: json["n"],
      );

  Map<String, dynamic> toJson() => {
        "T": t,
        "v": v,
        "vw": vw,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": resultT,
        "n": n,
      };
}
