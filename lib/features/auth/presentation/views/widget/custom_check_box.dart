import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/constants/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
        onTap: () {
          onChanged(!isChecked);
        },
        child: AnimatedContainer(
            width: 24,
            height: 24,
            decoration: ShapeDecoration(
              color: isChecked ? colors.primary : Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.50,
                  color: isChecked ? Colors.transparent : colors.outline,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            duration: const Duration(milliseconds: 50),
            child: isChecked
                ? Padding(
                    padding: const EdgeInsets.all(2),
                    child: SvgPicture.asset(
                      AppImages.imagesCheck,
                    ),
                  )
                : const SizedBox()));
  }
}
