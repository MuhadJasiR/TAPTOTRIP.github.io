import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_to_trip/core/color/constant_color.dart';
import 'package:tap_to_trip/core/size/const_size.dart';

class CustomCenterTitleText extends StatelessWidget {
  const CustomCenterTitleText({
    super.key,
    required this.layoutHeight,
  });

  final double layoutHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: layoutHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "EXPLORE DESTINATIONS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, color: kWhiteColor, fontFamily: 'Poppins'),
            ),
            kHeight(10),
            Text(
              "Let's make your best\ntrip ever",
              textAlign: TextAlign.center,
              style: GoogleFonts.shadowsIntoLight(
                fontSize: 40,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight(10),
            const Text(
              "Traveling is important in our life because it will open you up to a new way of living and being",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 8, color: kWhiteColor, fontFamily: 'Poppins'),
            ),
            kHeight(25),
            ElevatedButton(
              onPressed: () {
                log("Button Pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kWhiteColor,
                elevation: 0,
                side: const BorderSide(color: kPrimaryLightColor, width: 2),
              ),
              child: const Text(
                "Book now",
                style: TextStyle(color: kPrimaryLightColor),
              ),
            ),
            kHeight(100),
          ],
        ));
  }
}
