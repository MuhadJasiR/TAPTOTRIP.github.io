import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_to_trip/core/color/constant_color.dart';
import 'package:tap_to_trip/core/size/const_size.dart';
import 'package:tap_to_trip/presentation/widgets/custom_app_bar.dart';
import 'package:tap_to_trip/presentation/widgets/custom_center_title_text.dart';
import 'package:tap_to_trip/presentation/widgets/custom_our_location_details_card.dart';

import '../../core/const/constants.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          _onScroll();
        },
      );
    super.initState();
  }

  late double _scrollOffset = 0.0;

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;

      log(_scrollOffset.toString());
      debugPrint('Scroll Offset: $_scrollOffset');
    });
  }

//layers speed
  final double _layer1Speed = 0.5;
  final double _layer2Speed = 0.45;
  final double _layer3Speed = 0.42;
  final double _layer4Speed = 0.375;

//horizontal layer speed
  final double _layer1HSpeed = 0.1;
  final double _layer2HSpeed = 0.08;
  final double _layer3HSpeed = 0.075;
  final double _layer4HSpeed = 0.07;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var layoutHeight = screenSize.height * 5;

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              "assets/background_images/pexels-eliasgelmini-14000866.jpg"),
        )),
        child: Stack(
          children: [
            // Container(
            //   color: kBlackColor.withOpacity(0.5),
            // ),
            Positioned(
                bottom: _layer4Speed * _scrollOffset,
                right: _layer4HSpeed * _scrollOffset * -1,
                left: _layer4HSpeed * _scrollOffset * -1,
                child: SvgPicture.asset(
                  'assets/parallax_images/mountains-layer-4.svg',
                  color: kPrimaryLightColor,
                )),
            CustomCenterTitleText(layoutHeight: layoutHeight),
            Positioned(
                bottom: _layer3Speed * _scrollOffset,
                right: _layer3HSpeed * _scrollOffset * -1,
                left: _layer3HSpeed * _scrollOffset * -1,
                child: SvgPicture.asset(
                  'assets/parallax_images/mountains-layer-2.svg',
                  color: kPrimaryColor,
                )),
            Positioned(
                bottom: _layer2Speed * _scrollOffset,
                right: _layer2HSpeed * _scrollOffset * -1,
                left: _layer2HSpeed * _scrollOffset * -1,
                child: SvgPicture.asset(
                  color: kDarkGreen,
                  'assets/parallax_images/trees-layer-2.svg',
                )),
            Positioned(
                bottom: -50 + _layer1Speed * _scrollOffset,
                right: _layer1HSpeed * _scrollOffset * -1,
                left: _layer1HSpeed * _scrollOffset * -1,
                child: SvgPicture.asset(
                    color: kWhiteColor, 'assets/parallax_images/layer-1.svg')),
            SecondSection(
                screenSize: screenSize,
                layer1Speed: _layer1Speed,
                scrollOffset: _scrollOffset),
            const AppBarWidget(),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: SizedBox(
                  height: layoutHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondSection extends StatefulWidget {
  const SecondSection({
    super.key,
    required this.screenSize,
    required double layer1Speed,
    required double scrollOffset,
  })  : _layer1Speed = layer1Speed,
        _scrollOffset = scrollOffset;

  final Size screenSize;
  final double _layer1Speed;
  final double _scrollOffset;

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  @override
  Widget build(BuildContext context) {
    int index = 1;
    return Positioned(
        top: widget.screenSize.height +
            (widget._layer1Speed * widget._scrollOffset * -1),
        right: 0,
        left: 0,
        child: Container(
          height: widget.screenSize.height * 2,
          color: kWhiteColor,
          child: Column(
            children: [
              kHeight(100),
              Text("Our Locations",
                  style: GoogleFonts.pacifico(
                    fontSize: 30,
                    color: kPrimaryLightColor,
                  )),
              kHeight(20),
              CarouselSlider(
                  items: List.generate(
                    placeImages.length,
                    (index) {
                      return Container(
                        height: 200,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(placeImages[index])),
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(10)),
                      );
                    },
                  ),
                  options: CarouselOptions(
                      viewportFraction: 0.4,
                      autoPlay: true,
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      enlargeCenterPage: true)),
              CarouselSlider(
                  items: List.generate(
                    placeNames.length,
                    (index) {
                      return Column(
                        children: [
                          kHeight(10),
                          Text(
                            placeNames[index],
                            style: GoogleFonts.aboreto(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          kHeight(10),
                          Text(
                            placeDes[index],
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.aboreto(),
                          ),
                          kHeight(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OurLocationDetailsCard(
                                temperature: placeRating[index],
                                icon: Icons.cloud,
                              ),
                              const OurLocationDetailsCard(
                                temperature: ' Know more',
                                icon: Icons.info_outline_rounded,
                              ),
                              const OurLocationDetailsCard(
                                temperature: ' Rate',
                                icon: Icons.star,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                  options: CarouselOptions(
                      aspectRatio: 1.75,
                      autoPlay: true,
                      enlargeCenterPage: true)),
              const TrajectoriesWidget(),
              Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                          fit: BoxFit.cover, "assets/images/half_map.png"),
                      Center(
                        child: Column(
                          children: [
                            kHeight(100),
                            Text("International destinations",
                                style: GoogleFonts.pacifico(
                                  fontSize: 25,
                                  color: kPrimaryLightColor,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  CarouselSlider(items: [
                    Stack(children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/9470314_4187452.jpg"))),
                      ),
                      Positioned.fill(
                          child: Container(
                        margin: const EdgeInsets.all(20),
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kBlackColor.withOpacity(0.3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Trip Starts at",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                const Text(
                                  "Rs.29999/-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  "-Malaysia-",
                                  style: GoogleFonts.pacifico(
                                      fontSize: 50, color: kWhiteColor),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  log("jhgjhg1");
                                  setState(() {
                                    index = index + 1;
                                  });
                                },
                                icon: const Icon(
                                    Icons.arrow_forward_ios_rounded)),
                          ],
                        ),
                      ))
                    ]),
                  ], options: CarouselOptions(initialPage: index)),
                ],
              ),
            ],
          ),
        ));
  }
}

class TrajectoriesWidget extends StatelessWidget {
  const TrajectoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          kWidth(20),
          const Icon(Icons.flight_land_rounded),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 1,
                  width: 20,
                  color: kPrimaryLightColor,
                ),
                ...List.generate(
                  7,
                  (index) => Container(
                    height: 1,
                    width: 20,
                    color: kPrimaryLightColor,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.flight_takeoff_rounded),
          kWidth(20),
        ],
      ),
    );
  }
}
