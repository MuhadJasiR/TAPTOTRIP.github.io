import 'package:flutter/material.dart';
import 'package:tap_to_trip/core/color/constant_color.dart';

class OurLocationDetailsCard extends StatelessWidget {
  const OurLocationDetailsCard(
      {super.key, required this.temperature, required this.icon});

  final String temperature;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryLightColor,
            ),
            Text(
              "  $temperature",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
