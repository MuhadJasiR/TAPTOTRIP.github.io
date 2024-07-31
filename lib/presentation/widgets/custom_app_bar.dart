import 'package:flutter/material.dart';
import 'package:tap_to_trip/core/color/constant_color.dart';
import 'package:tap_to_trip/core/size/const_size.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       blurRadius: 3,
        //       color: kBlackColor.withOpacity(0.5),
        //       blurStyle: BlurStyle.outer,
        //     )
        //   ],
        //   borderRadius: BorderRadius.circular(20),
        //   color: kWhiteColor,
        // ),
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // Image.asset(
                //     height: 30, "assets/logo/Tap to Trip Logo Green.png"),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on,
                      color: kPrimaryLightColor,
                    )),
                const Text(
                  "TAP TO TRIP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const Text("Destination",
                        style: TextStyle(
                          color: kBlackColor,
                        ))),
                TextButton(
                    onPressed: () {},
                    child: const Text("Trip Plan",
                        style: TextStyle(
                          color: kBlackColor,
                        ))),
                TextButton(
                    onPressed: () {},
                    child: const Text("About Us",
                        style: TextStyle(
                          color: kBlackColor,
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
