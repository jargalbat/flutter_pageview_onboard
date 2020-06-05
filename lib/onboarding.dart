import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pageview_onboard/provider/index_notifier.dart';
import 'package:flutter_pageview_onboard/provider/offset_notifier.dart';
import 'package:flutter_pageview_onboard/widgets/greatwave.dart';
import 'package:flutter_pageview_onboard/widgets/reject.dart';
import 'package:flutter_pageview_onboard/widgets/samurai.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController = PageController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(_pageController),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hops",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "Graphik",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 10,
                        bottom: 8,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    Provider.of<IndexNotifier>(context, listen: false).index = index;
                  },
                  children: <Widget>[
                    Samurai(),
                    Reject(),
                    GreatWave(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
