import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marquee/marquee.dart';

class MyMarquee extends StatelessWidget {
  const MyMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.black,
          thickness: 8,
        ),
        SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Marquee(
              velocity: 120.0,
              text:
                  'TECHNOLOGY. SKIING. MUSIC. JOURNALING. FINANCE. BILLIARDS. SKYDIVING. ALGORITHMIC TRADING. BASKETBALL. GUITAR. MOUNTAIN BIKING. SCUBA DIVING. MEDITATION. ART. GOLF. CODING. HIKING. TENNIS. SURFING. POKER. READING. COOKING. MACROECONOMICS. YOGA. FRENCH. DANCING.',
              style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w900,
                  fontSize: 50)),
        ),
        Divider(
          color: Colors.black,
          thickness: 8,
        ),
      ],
    );
  }
}
