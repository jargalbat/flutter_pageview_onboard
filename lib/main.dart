import 'package:flutter/material.dart';
import 'package:flutter_pageview_onboard/onboarding.dart';
import 'package:flutter_pageview_onboard/provider/index_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => IndexNotifier(),
        child: Onboarding(),
      ),
    );
  }
}
