import 'package:anthony_and_april/main.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/gestures.dart';

import '../../controllers/responsive.dart';
import '../../controllers/router.dart';
import '../../models/theme_model.dart';
import '../../view/home/components/custom_app_bar.dart';
import '../../view/home/components/custom_drawer.dart';
import '../../widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controllers/constants.dart';
import '../../models/state_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final constantValues = Get.find<Constants>();
  var pageInfo = GetStorage();
  // Widget Keys
  final home = GlobalKey();
  final aboutUs = GlobalKey();
  final weddingProgram = GlobalKey();
  final hymLyrics = GlobalKey();
  final ourStory = GlobalKey();
  final memories = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    var mainFont = GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: size.width * 0.04,
            color: constantValues.primaryColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic));
    var mainFont2 = GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: size.width * 0.08,
            color: constantValues.primaryColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic));
    var mainFont3 = GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: size.width * 0.1,
            color: constantValues.primaryColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic));
    return Consumer<CustomStateModel>(
        builder: (context, value, child) => Scaffold(
              appBar: CustomAppBar(
                pageInfo: pageInfo,
                constantValues: constantValues,
                aboutUs: aboutUs,
                weddingProgram: weddingProgram,
                hymLyrics: hymLyrics,
                ourStory: ourStory,
                memories: memories,
              ),
              endDrawer: CustomDrawer(
                  constantValues: constantValues,
                  aboutUs: aboutUs,
                  weddingProgram: weddingProgram,
                  hymLyrics: hymLyrics,
                  ourStory: ourStory),
              floatingActionButton: Container(
                decoration: BoxDecoration(
                  color: constantValues.secondaryColor,
                  border: Border.all(
                    color: constantValues.secondaryColor,
                  ),
                  borderRadius: BorderRadius.circular(size.width * 0.026),
                ),
                child: IconButton(
                  tooltip:
                      pageInfo.read("isDarkTheme") ? "Turn on" : "Turn off",
                  onPressed: () {
                    setState(() {
                      pageInfo.write(
                          "isDarkTheme", !pageInfo.read("isDarkTheme"));
                    });
                    themeChanger.setTheme(pageInfo.read("isDarkTheme")
                        ? ThemeData.dark()
                        : ThemeData(
                            primarySwatch: MaterialColor(
                                0xFFF4511E, constantValues.defaultColor),
                            colorScheme: ColorScheme.fromSeed(
                                seedColor: constantValues.secondaryColor),
                            useMaterial3: true,
                            textTheme: GoogleFonts.poppinsTextTheme(),
                            brightness: Brightness.light));
                  },
                  icon: Icon(
                    pageInfo.read("isDarkTheme")
                        ? Icons.lightbulb_outline_rounded
                        : Icons.lightbulb_rounded,
                    color: constantValues.primaryColor,
                  ),
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Responsive(
                    isExtraLargeScreen:
                        isExtraLargeScreen(context, size, mainFont),
                    isTablet: isTablet(context, size, mainFont2),
                    isMobile: isMobile(context, size, mainFont3)),
              )),
            ));
  }

  Widget isExtraLargeScreen(BuildContext context, Size size, var font) {
    return Column(
      children: [
        //Heading
        Stack(
          key: home,
          children: [
            Container(
              height: size.height * 0.9,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: const AssetImage("assets/images/cover.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
              )),
            ),
            Positioned(
                top: size.height * 0.25,
                left: size.width * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnclickableButton(
                      text: "Welcome to...",
                      width: size.width * 0.1,
                      size: size,
                      fontSize: size.width * 0.01,
                      bgColor: Colors.red,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                            width: size.width * 0.4,
                            child: Text(
                              constantValues.heading,
                              style: font,
                              maxLines: 3,
                            ))
                        .animate(autoPlay: true)
                        .fadeIn(duration: const Duration(milliseconds: 3000))
                        .slideX(curve: Curves.bounceIn),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.35,
                      child: Text(
                        constantValues.summary,
                        style: TextStyle(color: constantValues.primaryColor),
                        maxLines: 4,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 3500))
                        .slideY(curve: Curves.slowMiddle),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        Icon(Icons.location_pin,
                            color: constantValues.primaryColor),
                        SizedBox(width: size.width * 0.005),
                        SizedBox(
                          width: size.width * 0.25,
                          child: Text(
                            constantValues.locationDetails,
                            style: TextStyle(
                              color: constantValues.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                        .animate(autoPlay: true)
                        .fadeIn(duration: const Duration(milliseconds: 3000))
                        .slideX(curve: Curves.bounceIn),
                    SizedBox(height: size.height * 0.04),
                    Row(
                      children: [
                        ButtonA(
                          width: size.width * 0.1,
                          bgColor: constantValues.secondaryColor,
                          borderColor: constantValues.primaryColor,
                          textColor: constantValues.primaryColor,
                          text: "09 November 2024",
                          authenticate: () {
                            Scrollable.ensureVisible(
                                weddingProgram.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                          },
                        ),
                        SizedBox(width: size.width * 0.04),
                        ButtonA(
                          width: size.width * 0.08,
                          bgColor: constantValues.transparentColor,
                          borderColor: constantValues.primaryColor,
                          textColor: constantValues.primaryColor,
                          text: "Our Story",
                          authenticate: () {
                            Scrollable.ensureVisible(
                                ourStory.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                          },
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
        SizedBox(height: size.height * 0.1),
        Column(
          children: [
            // ABOUT US
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Column(
                key: aboutUs,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          constantValues.aboutUs,
                          style: TextStyle(
                              color: constantValues.secondaryColor,
                              fontSize: size.width * 0.015,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: size.height * 0.01),
                        SizedBox(
                            width: size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  constantValues.summary2,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                Text(
                                  constantValues.author,
                                ),
                              ],
                            )),
                        SizedBox(height: size.height * 0.1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                        height: size.height * 0.4,
                                        width: size.width * 0.2,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/aboutHim.jpg"),
                                                fit: BoxFit.fitHeight)))
                                    .animate()
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 4500))
                                    .slideX(curve: Curves.linear),
                                SizedBox(height: size.height * 0.03),
                                Text(constantValues.him,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color:
                                                constantValues.secondaryColor,
                                            fontSize: size.width * 0.015))),
                                SizedBox(height: size.height * 0.02),
                                SizedBox(
                                    width: size.width * 0.2,
                                    child: Text(
                                      constantValues.aboutHim,
                                      textAlign: TextAlign.justify,
                                      maxLines: 20,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      RouteTo.openTab(
                                          constantValues.aboutHimUrl);
                                    },
                                    icon: Image.asset(
                                      "assets/icons/linkedin.png",
                                      scale: 20,
                                    ))
                              ],
                            ),
                            Container(
                              height: size.height * 0.2,
                              width: size.width * 0.1,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/icons/love.png"),
                                      fit: BoxFit.fitHeight)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * 0.4,
                                  width: size.width * 0.2,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/aboutHer.jpg"),
                                          fit: BoxFit.fitHeight)),
                                )
                                    .animate()
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 4500))
                                    .slideY(curve: Curves.linear),
                                SizedBox(height: size.height * 0.03),
                                Text(constantValues.her,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      color: constantValues.secondaryColor,
                                      fontSize: size.width * 0.015,
                                    ))),
                                SizedBox(height: size.height * 0.02),
                                SizedBox(
                                    width: size.width * 0.2,
                                    child: Text(
                                      constantValues.aboutHer,
                                      textAlign: TextAlign.justify,
                                      maxLines: 20,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      RouteTo.openTab(
                                          constantValues.aboutHerUrl);
                                    },
                                    icon: Image.asset(
                                      "assets/icons/linkedin.png",
                                      scale: 20,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),
            //WEDDING PROGRAM
            Stack(
              key: weddingProgram,
              children: [
                Container(
                  height: size.height * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage("assets/images/ocean.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  )),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.43,
                  child: Text(
                    constantValues.program,
                    style: TextStyle(
                        color: constantValues.secondaryColor,
                        fontSize: size.width * 0.015,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                Positioned(
                    top: size.height * 0.2,
                    left: size.width * 0.18,
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order of Service",
                                style: TextStyle(
                                    color: constantValues.secondaryColor,
                                    fontSize: size.width * 0.012),
                                maxLines: 2,
                              ),
                              Text(
                                "Order of Photography",
                                style: TextStyle(
                                    color: constantValues.secondaryColor,
                                    fontSize: size.width * 0.012),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(constantValues.programDetails1,
                                      style: TextStyle(
                                          color: constantValues.primaryColor,
                                          fontSize: size.width * 0.01),
                                      maxLines: 200)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(constantValues.programDetails2,
                                      style: TextStyle(
                                          color: constantValues.primaryColor,
                                          fontSize: size.width * 0.01),
                                      maxLines: 200)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // HYM LYRICS
            Column(
              key: hymLyrics,
              children: [
                Text(
                  constantValues.hym,
                  style: TextStyle(
                      color: constantValues.secondaryColor,
                      fontSize: size.width * 0.015,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
                  child: SizedBox(
                    height: size.height * 1.2,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing:
                              size.width * 0.02, // spacing between rows
                          crossAxisSpacing:
                              size.height * 0.015, // spacing between columns
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: constantValues.hyms.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, _) => SizedBox(
                                  width: size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          constantValues.hyms[index]["title"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          constantValues.hyms[index]["content"],
                                          maxLines: 2000,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // OUR STORY
            Stack(
              key: ourStory,
              children: [
                Container(
                  height: size.height * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage("assets/images/road.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  )),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.42,
                  child: Text(
                    constantValues.story,
                    style: TextStyle(
                        color: constantValues.secondaryColor,
                        fontSize: size.width * 0.015,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                Positioned(
                  top: size.height * 0.15,
                  left: size.width * 0.18,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
                    child: SizedBox(
                      width: size.width * 0.65,
                      child: Text(
                        constantValues.storyDetails,
                        style: TextStyle(color: constantValues.primaryColor),
                        textAlign: TextAlign.justify,
                        maxLines: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // MEMORIES
            Column(
              key: memories,
              children: [
                Text(
                  constantValues.memory,
                  style: TextStyle(
                      color: constantValues.secondaryColor,
                      fontSize: size.width * 0.015,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.05,
                      horizontal: size.width * 0.35),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: size.height * 0.4,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.41,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (ind, _) {}),
                    items: [1, 2, 3, 4].map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: constantValues.secondaryColor,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${constantValues.memoriesDetail[index]}"))),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Footer(size: size)
          ],
        ),
      ],
    );
  }

  Widget isTablet(BuildContext context, Size size, var font) {
    return Column(
      children: [
        //Heading
        Stack(
          key: home,
          children: [
            Container(
              height: size.height * 0.9,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: const AssetImage("assets/images/cover.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
              )),
            ),
            Positioned(
                top: size.height * 0.28,
                left: size.width * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnclickableButton(
                      text: "Welcome to...",
                      width: size.width * 0.4,
                      size: size,
                      fontSize: size.width * 0.02,
                      bgColor: Colors.red,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                            width: size.width * 0.7,
                            child: Text(
                              constantValues.heading,
                              style: font,
                              maxLines: 3,
                            ))
                        .animate(autoPlay: true)
                        .fadeIn(duration: const Duration(milliseconds: 4500))
                        .slideX(curve: Curves.bounceIn),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.65,
                      child: Text(
                        constantValues.summary,
                        style: TextStyle(color: constantValues.primaryColor),
                        maxLines: 8,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 5000))
                        .slideY(curve: Curves.slowMiddle),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: constantValues.primaryColor,
                        ),
                        SizedBox(width: size.width * 0.01),
                        SizedBox(
                          width: size.width * 0.5,
                          child: Text(
                            constantValues.locationDetails,
                            style:
                                TextStyle(color: constantValues.primaryColor,
                              fontWeight: FontWeight.w600,),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                        .animate(autoPlay: true)
                        .fadeIn(duration: const Duration(milliseconds: 3000))
                        .slideX(curve: Curves.bounceIn),
                    SizedBox(height: size.height * 0.04),
                    Row(
                      children: [
                        ButtonA(
                          width: size.width * 0.1,
                          bgColor: constantValues.secondaryColor,
                          borderColor: constantValues.primaryColor,
                          textColor: constantValues.primaryColor,
                          text: "09 November 2024",
                          authenticate: () {
                            Scrollable.ensureVisible(
                                weddingProgram.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                          },
                        ),
                        SizedBox(width: size.width * 0.04),
                        ButtonA(
                          width: size.width * 0.08,
                          bgColor: constantValues.transparentColor,
                          borderColor: constantValues.primaryColor,
                          textColor: constantValues.primaryColor,
                          text: "Our Story",
                          authenticate: () {
                            Scrollable.ensureVisible(
                                ourStory.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                          },
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
        SizedBox(height: size.height * 0.1),
        Column(
          children: [
            // ABOUT US
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Column(
                key: aboutUs,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          constantValues.aboutUs,
                          style: TextStyle(
                              color: constantValues.secondaryColor,
                              fontSize: size.width * 0.02,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: size.height * 0.01),
                        SizedBox(
                            width: size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  constantValues.summary2,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                ),
                                Text(
                                  constantValues.author,
                                ),
                              ],
                            )),
                        SizedBox(height: size.height * 0.1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                        height: size.height * 0.5,
                                        width: size.width * 0.3,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/aboutHim.jpg"),
                                                fit: BoxFit.fitHeight)))
                                    .animate()
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 4500))
                                    .slideX(curve: Curves.linear),
                                SizedBox(height: size.height * 0.03),
                                Text(constantValues.him,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      color: constantValues.secondaryColor,
                                      fontSize: size.width * 0.015,
                                    ))),
                                SizedBox(height: size.height * 0.02),
                                SizedBox(
                                    width: size.width * 0.7,
                                    child: Text(
                                      constantValues.aboutHim,
                                      textAlign: TextAlign.justify,
                                      maxLines: 40,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      RouteTo.openTab(
                                          constantValues.aboutHimUrl);
                                    },
                                    icon: Image.asset(
                                      "assets/icons/linkedin.png",
                                      scale: 20,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/love.png"),
                                          fit: BoxFit.fitHeight)),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * 0.5,
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/aboutHer.jpg"),
                                          fit: BoxFit.fitHeight)),
                                )
                                    .animate()
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 4500))
                                    .slideY(curve: Curves.linear),
                                SizedBox(height: size.height * 0.03),
                                Text(constantValues.her,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      color: constantValues.secondaryColor,
                                      fontSize: size.width * 0.015,
                                    ))),
                                SizedBox(height: size.height * 0.02),
                                SizedBox(
                                    width: size.width * 0.7,
                                    child: Text(
                                      constantValues.aboutHer,
                                      textAlign: TextAlign.justify,
                                      maxLines: 40,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      RouteTo.openTab(
                                          constantValues.aboutHerUrl);
                                    },
                                    icon: Image.asset(
                                      "assets/icons/linkedin.png",
                                      scale: 20,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),
            //WEDDING PROGRAM
            Stack(
              key: weddingProgram,
              children: [
                Container(
                  height: size.height * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage("assets/images/ocean.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  )),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.4,
                  child: Text(
                    constantValues.program,
                    style: TextStyle(
                        color: constantValues.secondaryColor,
                        fontSize: size.width * 0.02,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                Positioned(
                    top: size.height * 0.2,
                    left: size.width * 0.12,
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order of Service",
                                style: TextStyle(
                                    color: constantValues.secondaryColor,
                                    fontSize: size.width * 0.015),
                                maxLines: 2,
                              ),
                              Text(
                                "Order of Photography",
                                style: TextStyle(
                                    color: constantValues.secondaryColor,
                                    fontSize: size.width * 0.015),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(constantValues.programDetails1,
                                      style: TextStyle(
                                          color: constantValues.primaryColor,
                                          fontSize: size.width * 0.015),
                                      maxLines: 200)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(constantValues.programDetails2,
                                      style: TextStyle(
                                          color: constantValues.primaryColor,
                                          fontSize: size.width * 0.015),
                                      maxLines: 200)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // HYM LYRICS
            Column(
              key: hymLyrics,
              children: [
                Text(
                  constantValues.hym,
                  style: TextStyle(
                      color: constantValues.secondaryColor,
                      fontSize: size.width * 0.02,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
                  child: SizedBox(
                    height: size.height * 1.2,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing:
                              size.width * 0.02, // spacing between rows
                          crossAxisSpacing:
                              size.height * 0.015, // spacing between columns
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: constantValues.hyms.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, _) => SizedBox(
                                  width: size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          constantValues.hyms[index]["title"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          constantValues.hyms[index]["content"],
                                          maxLines: 2000,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // OUR STORY
            Stack(
              key: ourStory,
              children: [
                Container(
                  height: size.height * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage("assets/images/road.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  )),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.42,
                  child: Text(
                    constantValues.story,
                    style: TextStyle(
                        color: constantValues.secondaryColor,
                        fontSize: size.width * 0.015,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                Positioned(
                  top: size.height * 0.12,
                  left: size.width * 0.12,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
                    child: SizedBox(
                      width: size.width * 0.75,
                      child: Text(
                        constantValues.storyDetails,
                        style: TextStyle(color: constantValues.primaryColor),
                        textAlign: TextAlign.justify,
                        maxLines: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // MEMORIES
            Column(
              key: memories,
              children: [
                Text(
                  constantValues.memory,
                  style: TextStyle(
                      color: constantValues.secondaryColor,
                      fontSize: size.width * 0.015,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.05,
                      horizontal: size.width * 0.35),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: size.height * 0.4,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.41,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (ind, _) {}),
                    items: [1, 2, 3, 4].map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: constantValues.secondaryColor,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${constantValues.memoriesDetail[index]}"))),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Footer(size: size)
          ],
        ),
      ],
    );
  }

  Widget isMobile(BuildContext context, Size size, var font) {
    return Column(
      children: [
        //Heading
        Stack(
          key: home,
          children: [
            Container(
              height: size.height * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: const AssetImage("assets/images/cover.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
              )),
            ),
            Positioned(
                top: size.height * 0.05,
                left: size.width * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnclickableButton(
                      text: "Welcome to...",
                      width: size.width * 0.4,
                      size: size,
                      fontSize: size.width * 0.04,
                      bgColor: Colors.red,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                            width: size.width * 0.8,
                            child: Text(
                              constantValues.heading,
                              style: font,
                              maxLines: 3,
                            ))
                        .animate(autoPlay: true)
                        .fadeIn(duration: const Duration(milliseconds: 4500))
                        .slideX(curve: Curves.bounceIn),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.85,
                      child: Text(
                        constantValues.summary,
                        style: TextStyle(color: constantValues.primaryColor),
                        maxLines: 8,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 5000))
                        .slideY(curve: Curves.slowMiddle),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: constantValues.primaryColor,
                        ),
                        SizedBox(width: size.width * 0.01),
                        SizedBox(
                          width: size.width * 0.7,
                          child: Text(
                            constantValues.locationDetails,
                            style:
                                TextStyle(color: constantValues.primaryColor,
                              fontWeight: FontWeight.w600,),
                            maxLines: 10,
                          ),
                        ),
                      ],
                    )
                        .animate(autoPlay: true)
                        .fadeIn(duration: const Duration(milliseconds: 3000))
                        .slideX(curve: Curves.bounceIn),
                    SizedBox(height: size.height * 0.04),
                    Row(
                      children: [
                        ButtonA(
                          width: size.width * 0.1,
                          bgColor: constantValues.secondaryColor,
                          borderColor: constantValues.primaryColor,
                          textColor: constantValues.primaryColor,
                          text: "09 November 2024",
                          authenticate: () {
                            Scrollable.ensureVisible(
                                weddingProgram.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                          },
                        ),
                        SizedBox(width: size.width * 0.04),
                        ButtonA(
                          width: size.width * 0.08,
                          bgColor: constantValues.transparentColor,
                          borderColor: constantValues.primaryColor,
                          textColor: constantValues.primaryColor,
                          text: "Our Story",
                          authenticate: () {
                            Scrollable.ensureVisible(
                                ourStory.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                          },
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
        SizedBox(height: size.height * 0.1),
        Column(
          children: [
            // ABOUT US
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                key: aboutUs,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          constantValues.aboutUs,
                          style: TextStyle(
                              color: constantValues.secondaryColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: size.height * 0.01),
                        SizedBox(
                            width: size.width * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  constantValues.summary2,
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                ),
                                Text(
                                  constantValues.author,
                                ),
                              ],
                            )),
                        SizedBox(height: size.height * 0.1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                        height: size.height * 0.5,
                                        width: size.width * 0.6,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/aboutHim.jpg"),
                                                fit: BoxFit.fitHeight)))
                                    .animate()
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 4500))
                                    .slideX(curve: Curves.linear),
                                SizedBox(height: size.height * 0.03),
                                Text(constantValues.him,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      color: constantValues.secondaryColor,
                                      fontSize: size.width * 0.04,
                                    ))),
                                SizedBox(height: size.height * 0.01),
                                SizedBox(
                                    width: size.width * 0.85,
                                    child: Text(
                                      constantValues.aboutHim,
                                      textAlign: TextAlign.justify,
                                      maxLines: 40,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      RouteTo.openTab(
                                          constantValues.aboutHimUrl);
                                    },
                                    icon: Image.asset(
                                      "assets/icons/linkedin.png",
                                      scale: 20,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: size.height * 0.1,
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/love.png"),
                                          fit: BoxFit.fitHeight)),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * 0.5,
                                  width: size.width * 0.6,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/aboutHer.jpg"),
                                          fit: BoxFit.fitHeight)),
                                )
                                    .animate()
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 4500))
                                    .slideY(curve: Curves.linear),
                                SizedBox(height: size.height * 0.03),
                                Text(constantValues.her,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      color: constantValues.secondaryColor,
                                      fontSize: size.width * 0.04,
                                    ))),
                                SizedBox(height: size.height * 0.01),
                                SizedBox(
                                    width: size.width * 0.85,
                                    child: Text(
                                      constantValues.aboutHer,
                                      textAlign: TextAlign.justify,
                                      maxLines: 40,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      RouteTo.openTab(
                                          constantValues.aboutHerUrl);
                                    },
                                    icon: Image.asset(
                                      "assets/icons/linkedin.png",
                                      scale: 20,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),
            //WEDDING PROGRAM
            Stack(
              key: weddingProgram,
              children: [
                Container(
                  height: size.height * 1.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage("assets/images/ocean.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  )),
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.25,
                  child: Text(
                    constantValues.program,
                    style: TextStyle(
                        color: constantValues.secondaryColor,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                Positioned(
                    top: size.height * 0.1,
                    left: size.width * 0.1,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order of Service",
                              style: TextStyle(
                                  color: constantValues.secondaryColor,
                                  fontSize: size.width * 0.03),
                              maxLines: 2,
                            ),
                            SizedBox(
                              width: size.width * 0.7,
                              child: Text(constantValues.programDetails1,
                                  style: TextStyle(
                                      color: constantValues.primaryColor,
                                      fontSize: size.width * 0.028),
                                  maxLines: 200),
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order of Photography",
                              style: TextStyle(
                                  color: constantValues.secondaryColor,
                                  fontSize: size.width * 0.03),
                              maxLines: 2,
                            ),
                            SizedBox(height: size.height * 0.01),
                            SizedBox(
                              width: size.width * 0.7,
                              child: Text(constantValues.programDetails2,
                                  style: TextStyle(
                                      color: constantValues.primaryColor,
                                      fontSize: size.width * 0.028),
                                  maxLines: 200),
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // HYM LYRICS
            Column(
              key: hymLyrics,
              children: [
                Text(
                  constantValues.hym,
                  style: TextStyle(
                      color: constantValues.secondaryColor,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: SizedBox(
                    height: size.height * 1.2,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // number of items in each row
                          mainAxisSpacing:
                              size.width * 0.02, // spacing between rows
                          crossAxisSpacing:
                              size.height * 0.015, // spacing between columns
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: constantValues.hyms.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, _) => SizedBox(
                                  width: size.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          constantValues.hyms[index]["title"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          constantValues.hyms[index]["content"],
                                          maxLines: 2000,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // OUR STORY
            Stack(
              key: ourStory,
              children: [
                Container(
                  height: size.height * 1.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage("assets/images/road.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  )),
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.25,
                  child: Text(
                    constantValues.story,
                    style: TextStyle(
                        color: constantValues.secondaryColor,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                Positioned(
                  top: size.height * 0.07,
                  left: size.width * 0.1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: SizedBox(
                      width: size.width * 0.8,
                      child: Text(
                        constantValues.storyDetails,
                        style: TextStyle(color: constantValues.primaryColor),
                        textAlign: TextAlign.justify,
                        maxLines: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            // MEMORIES
            Column(
              key: memories,
              children: [
                Text(
                  constantValues.memory,
                  style: TextStyle(
                      color: constantValues.secondaryColor,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.05,
                      horizontal: size.width * 0.01),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: size.height * 0.5,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.41,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (ind, _) {}),
                    items: [1, 2, 3, 4].map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: constantValues.secondaryColor,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${constantValues.memoriesDetail[index]}"))),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Footer(size: size)
          ],
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  Footer({super.key, required this.size});
  late Size size;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: constantValues.darkColor,
      height: size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            constantValues.footerDetails,
            style: TextStyle(color: constantValues.secondaryColor),
          ),
          RichText(
            text: TextSpan(
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: constantValues.primaryColor,
                )),
                children: [
                  const TextSpan(
                    text: "Created by ",
                  ),
                  TextSpan(
                      text: "Joanes",
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          RouteTo.openTab(constantValues.footerUrl);
                        }),
                ]),
          ),
        ],
      ),
    );
  }
}
