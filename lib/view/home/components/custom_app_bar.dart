import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.pageInfo,
    required this.constantValues,
    required this.aboutUs,
    required this.weddingProgram,
    required this.hymLyrics,
    required this.ourStory,
    required this.memories,
  });
  final GetStorage pageInfo;
  final Constants constantValues;
  final GlobalKey<State<StatefulWidget>> aboutUs;
  final GlobalKey<State<StatefulWidget>> weddingProgram;
  final GlobalKey<State<StatefulWidget>> hymLyrics;
  final GlobalKey<State<StatefulWidget>> ourStory;
  final GlobalKey<State<StatefulWidget>> memories;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 700) {
        return AppBar(
          backgroundColor: constantValues.transparentColor,
          foregroundColor: constantValues.transparentColor,
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
                onTap: () => context.goNamed("home"),
                child: Image.asset("assets/icons/logo.png", scale: 1)),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Scrollable.ensureVisible(
                      aboutUs.currentContext as BuildContext,
                      duration: const Duration(seconds: 2));
                },
                child: const Text("About Us")),
            SizedBox(width: size.width * 0.02),
            TextButton(
                onPressed: () {
                  Scrollable.ensureVisible(
                      weddingProgram.currentContext as BuildContext,
                      duration: const Duration(seconds: 2));
                },
                child: const Text("Program")),
            SizedBox(width: size.width * 0.02),
            TextButton(
                onPressed: () {
                  Scrollable.ensureVisible(
                      hymLyrics.currentContext as BuildContext,
                      duration: const Duration(seconds: 2));
                },
                child: const Text("Hym")),
            SizedBox(width: size.width * 0.02),
            TextButton(
                onPressed: () {
                  Scrollable.ensureVisible(
                      ourStory.currentContext as BuildContext,
                      duration: const Duration(seconds: 2));
                },
                child: const Text("Our Story")),
            SizedBox(width: size.width * 0.02),
            TextButton(
                onPressed: () {
                  Scrollable.ensureVisible(
                      memories.currentContext as BuildContext,
                      duration: const Duration(seconds: 2));
                },
                child: const Text("Memories")),
            SizedBox(width: size.width * 0.3),
          ],
        );
      } else {
        return AppBar(
          backgroundColor: constantValues.transparentColor,
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/icons/logo.png", scale: 3),
          ),
          title: Text(
            "A & A",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.badScript(textStyle: const TextStyle()),
          ),
        );
      }
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
