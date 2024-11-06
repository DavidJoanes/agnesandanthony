import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(
      {super.key,
      required this.constantValues,
      required this.aboutUs,
      required this.weddingProgram,
      required this.hymLyrics,
      required this.ourStory});

  final Constants constantValues;
  final GlobalKey<State<StatefulWidget>> aboutUs;
  final GlobalKey<State<StatefulWidget>> weddingProgram;
  final GlobalKey<State<StatefulWidget>> hymLyrics;
  final GlobalKey<State<StatefulWidget>> ourStory;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 700) {
        return const Text("");
      } else {
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/icons/logo.png"),
                    fit: BoxFit.fitWidth,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.02),
                  child: Column(
                    children: [
                      ListTile(
                          leading: Icon(Icons.info,
                              color: constantValues.secondaryColor),
                          title: const Text("About Us"),
                          onTap: () {
                            Scrollable.ensureVisible(
                                aboutUs.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                            context.pop();
                          }),
                      SizedBox(height: size.height * 0.01),
                      const Divider(),
                      SizedBox(height: size.height * 0.01),
                      ListTile(
                          leading: Icon(Icons.list,
                              color: constantValues.secondaryColor),
                          title: const Text("Program"),
                          onTap: () {
                            Scrollable.ensureVisible(
                                weddingProgram.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                            context.pop();
                          }),
                      SizedBox(height: size.height * 0.01),
                      const Divider(),
                      SizedBox(height: size.height * 0.01),
                      ListTile(
                          leading: Icon(Icons.read_more,
                              color: constantValues.secondaryColor),
                          title: const Text("Hym"),
                          onTap: () {
                            Scrollable.ensureVisible(
                                hymLyrics.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                            context.pop();
                          }),
                      SizedBox(height: size.height * 0.01),
                      const Divider(),
                      SizedBox(height: size.height * 0.01),
                      ListTile(
                          leading: Icon(Icons.travel_explore,
                              color: constantValues.secondaryColor),
                          title: const Text("Our Story"),
                          onTap: () {
                            Scrollable.ensureVisible(
                                ourStory.currentContext as BuildContext,
                                duration: const Duration(seconds: 2));
                            context.pop();
                          }),
                      SizedBox(height: size.height * 0.05),
                      Text("Ver: ${constantValues.appVersion}")
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
