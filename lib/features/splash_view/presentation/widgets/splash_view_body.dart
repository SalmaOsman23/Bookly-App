import 'package:bookly_app/core/utils/app_assets.dart';
import 'package:bookly_app/core/utils/app_strings.dart';
import 'package:bookly_app/features/splash_view/presentation/widgets/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(
            animationController); //Tween changes the values of animation controller to , Offset refers to transition through x and y axis
  }

  //it's important to dispose controller,
  // as controllers are resources that if aren't disposed it'll remain open
  // even if the widget is closed so it will make memory leak

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.logo),
        const SizedBox(
          height: 4.0,
        ),
        //to allow this widget to be only updated when the value of the animation changes
        //rebuild this widget only without rebuilding the whole ui
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
