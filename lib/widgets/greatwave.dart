import 'package:flutter/material.dart';
import 'package:flutter_pageview_onboard/provider/offset_notifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class GreatWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform.scale(
                    scale: math.max(0, 1 - (1 - (4 * notifier.page - 7))),
                    child: child,
                  );
                },
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Container(),
                ),
              ),

              /// Icon
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.translationValues(0, 100 * (1 - (4 * notifier.page - 7)), 0)
                      ..rotateZ(
                        (-math.pi / 2) * 2 * notifier.page,
                      ),
                    child: child,
                  );
                },
                child: Container(
                  child: Icon(Icons.print, size: 150),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20.0),

        /// Text
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            return Opacity(
              opacity: math.max(0, 4 * notifier.page - 7),
              child: child,
            );
          },
          child: Container(
            child: Text(
              'Samurai',
              style: TextStyle(color: Colors.blue, fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
