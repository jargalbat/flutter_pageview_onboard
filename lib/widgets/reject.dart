import 'package:flutter/material.dart';
import 'package:flutter_pageview_onboard/provider/offset_notifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Reject extends StatelessWidget {
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
                  double multiplier;

                  if (notifier.page <= 1.0) {
                    multiplier = math.max(0, 4 * notifier.page - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * notifier.page - 4));
                  }

                  return Transform.scale(
                    scale: multiplier,
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
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  double multiplier;

                  if (notifier.page <= 1.0) {
                    multiplier = math.max(0, 4 * notifier.page - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * notifier.page - 4));
                  }

                  return Transform.translate(
                    offset: Offset(0, -50 * (1 - multiplier)),
//                    offset: Offset(-50 * (1 - multiplier), 0),
//                    offset: Offset(50 * (1 + multiplier), 0),
                    child: Opacity(
                      opacity: multiplier,
                      child: child,
                    ),
                  );
                },
                child: Container(
                  child: Icon(Icons.shop, size: 150),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20.0),

        /// Text
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            double multiplier;

            if (notifier.page <= 1.0) {
              multiplier = math.max(0, 4 * notifier.page - 3);
            } else {
              multiplier = math.max(0, 1 - (4 * notifier.page - 4));
            }

            return Transform.translate(
              offset: Offset(0, 50 * (1 - multiplier)),
              child: Opacity(
                opacity: multiplier,
                child: child,
              ),
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
