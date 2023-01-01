import 'package:flutter/material.dart';
import 'package:nasa_flutter/config/theme/app_colors.dart';
import 'package:nasa_flutter/constants/app_constants.dart';
import 'package:nasa_flutter/utils/ui/custom_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double? buttonWidth;
  final double? buttonHeight;
  final Function onTap;
  var color;

  PrimaryButton({
    Key? key,
    required this.text,
    this.buttonHeight,
    this.buttonWidth,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap.call();
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(color ?? AppColors().secondary),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(buttonWidth ?? double.infinity, buttonHeight ?? 0.15 * width),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(buttonWidth ?? double.infinity, 0.15 * width),
        ),
      ),
      child: CustomText(
        text: text,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
