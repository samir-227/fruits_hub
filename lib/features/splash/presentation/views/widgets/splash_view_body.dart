import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(AppImages.imagesPlant),
          ],
        ),
        SvgPicture.asset(AppImages.imagesSplashImage),
        SvgPicture.asset(
          AppImages.imagesSplashCircles,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
