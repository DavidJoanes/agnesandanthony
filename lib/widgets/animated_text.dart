import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/constants.dart';


final constantValues = Get.find<Constants>();
var pageInfo = GetStorage();

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.0 * 5,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        builder: (context, value, child) => Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.black,
              color: constantValues.secondaryColor,
              value: value,
            ),
            const SizedBox(
              height: 20.0 / 2,
            ),
            Text(
              '${(value * 100).toInt()}%',
              style:  TextStyle(
                  color: constantValues.primaryColor,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: constantValues.primaryColor,
                        blurRadius: 10,
                        offset: Offset(2, 2)),
                    Shadow(
                        color: constantValues.secondaryColor,
                        blurRadius: 10,
                        offset: const Offset(-2, -2)),
                  ]),
            )
          ],
        ),
        tween: Tween(begin: 0.0, end: 1.0),
      ),
    );
  }
}
