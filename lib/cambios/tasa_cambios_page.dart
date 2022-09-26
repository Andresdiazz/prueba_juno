import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juno_prueba/cambios/providers/daily_provider.dart';
import 'package:juno_prueba/widgets/botton_time.dart';
import 'package:juno_prueba/widgets/colors.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model/daily.dart';

class TasaCambiosPage extends StatefulWidget {
  const TasaCambiosPage({Key? key}) : super(key: key);

  @override
  State<TasaCambiosPage> createState() => _TasaCambiosPageState();
}

class _TasaCambiosPageState extends State<TasaCambiosPage> {
  bool select1 = true;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  bool select5 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          contentCambio(),
          const SizedBox(
            height: 24,
          ),
          contentGrafica(),
          const SizedBox(
            height: 16,
          ),
          buttonsTime(),
        ],
      ),
    );
  }

  Row buttonsTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonTime(
            select: select1,
            title: '24 H',
            onPressed: () {
              setState(() {
                select1 = true;
                select2 = false;
                select3 = false;
                select4 = false;
                select5 = false;
              });
            }),
        ButtonTime(
            select: select2,
            title: '5 D',
            onPressed: () {
              setState(() {
                select1 = false;
                select2 = true;
                select3 = false;
                select4 = false;
                select5 = false;
              });
            }),
        ButtonTime(
            select: select3,
            title: '1 M',
            onPressed: () {
              setState(() {
                select1 = false;
                select2 = false;
                select3 = true;
                select4 = false;
                select5 = false;
              });
            }),
        ButtonTime(
            select: select4,
            title: '1 Y',
            onPressed: () {
              setState(() {
                select1 = false;
                select2 = false;
                select3 = false;
                select4 = true;
                select5 = false;
              });
            }),
        ButtonTime(
            select: select5,
            title: '2 Y',
            onPressed: () {
              setState(() {
                select1 = false;
                select2 = false;
                select3 = false;
                select4 = false;
                select5 = true;
              });
            }),
      ],
    );
  }

  contentCambio() {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorStyle.neutral10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '\$1446',
                      style: TextStyle(fontSize: 54, color: ColorStyle.negro),
                    ),
                    Text(
                      '=1 USD',
                      style: TextStyle(fontSize: 16, color: ColorStyle.negro),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: ColorStyle.azul),
                  child: const Text(
                    'COP',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  FontAwesomeIcons.circleInfo,
                  color: ColorStyle.neutral80,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  contentGrafica() {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorStyle.neutral10),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: SfCartesianChart(
                  // Initialize category axis
                  title: ChartTitle(text: 'TRM USD > COP'),
                  primaryXAxis: CategoryAxis(),
                  series: <SplineAreaSeries<SalesData, String>>[
                    SplineAreaSeries<SalesData, String>(
                        gradient: LinearGradient(
                            colors: [
                              ColorStyle.verde.withOpacity(0),
                              ColorStyle.verde
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        // Bind data source
                        dataSource: <SalesData>[
                          SalesData(
                              '2020',
                              select1 == true
                                  ? 40
                                  : select2 == true
                                      ? 20
                                      : select3 == true
                                          ? 15
                                          : select4 == true
                                              ? 40
                                              : 55),
                          SalesData(
                              '2021',
                              select1 == true
                                  ? 10
                                  : select2 == true
                                      ? 70
                                      : select3 == true
                                          ? 53
                                          : select4 == true
                                              ? 20
                                              : 70),
                          SalesData(
                              '2022',
                              select1 == true
                                  ? 40
                                  : select2 == true
                                      ? 20
                                      : select3 == true
                                          ? 15
                                          : select4 == true
                                              ? 40
                                              : 40),
                          SalesData(
                              '2023',
                              select1 == true
                                  ? 40
                                  : select2 == true
                                      ? 20
                                      : select3 == true
                                          ? 44
                                          : select4 == true
                                              ? 40
                                              : 53),
                          SalesData(
                              '2024',
                              select1 == true
                                  ? 40
                                  : select2 == true
                                      ? 20
                                      : select3 == true
                                          ? 22
                                          : select4 == true
                                              ? 40
                                              : 20),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales)
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _dailyList() {
    final dailyProvider = Provider.of<DailyProvider>(context);
    return FutureBuilder(
      future: dailyProvider.getDaily(),
      builder: (_, AsyncSnapshot<List<Result>>? snapshot) {
        if (snapshot!.hasData) {
          final result = snapshot.data;
          return ListView.builder(
              itemCount: result!.length,
              itemBuilder: (_, int i) {
                return _card(result[i]);
              });
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _card(Result result) {
    final dailyProvider = Provider.of<DailyProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            elevation: 3,
            child: ListTile(
                title: Text(
                  result.t,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  result.t,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {}),
          ),
        ),
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
