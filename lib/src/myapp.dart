import 'package:flutter/material.dart';
import 'package:juno_prueba/providers/daily_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/navigation_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DailyProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NavigationBarPrincipal(),
      ),
    );
  }
}
