import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/constants.dart';
import '../../widgets/animated_container.dart';
import '../../widgets/animated_text.dart';

final constantValues = Get.find<Constants>();
var pageInfo = GetStorage();

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.goNamed("home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantValues.darkColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(
              width: 100,
              height: 100,
              splashScreen: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
