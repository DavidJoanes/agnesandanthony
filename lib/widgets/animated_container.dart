import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/constants.dart';

class AnimatedImageContainer extends StatefulWidget {
  AnimatedImageContainer(
      {super.key, this.height = 300, this.width = 250, this.splashScreen});
  final double? width;
  final double? height;
  late bool? splashScreen;

  @override
  State<AnimatedImageContainer> createState() => _AnimatedImageContainerState();
}

class _AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final constantValues = Get.find<Constants>();
  var pageInfo = GetStorage();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(20.0 / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                constantValues.secondaryColor2,
                constantValues.secondaryColor,
              ]),
              boxShadow: [
                BoxShadow(
                  color: constantValues.secondaryColor2,
                  offset: const Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: constantValues.secondaryColor,
                  offset: const Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                widget.splashScreen!
                    ? 'assets/images/love.png'
                    : 'assets/images/love.png',
                height: 200,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
