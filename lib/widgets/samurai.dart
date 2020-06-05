import 'package:flutter/material.dart';
import 'package:flutter_pageview_onboard/provider/offset_notifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Samurai extends StatelessWidget {
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
                    scale: math.max(0, 1 - notifier.page),
                    child: Opacity(
                      opacity: math.max(0, math.max(0, 1 - notifier.page)),
                      child: child,
                    ),
                  );
                },
                child: Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                  ),
                ),
              ),

              /// Icon
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform.rotate(
                    angle: math.max(0, (math.pi / 2) * 4 * notifier.page),
                    child: Opacity(
                      opacity: math.max(0, math.max(0, 1 - notifier.page)),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  child: Icon(Icons.home, size: 150),
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
              opacity: math.max(0, 1 - 4 * notifier.page),
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
