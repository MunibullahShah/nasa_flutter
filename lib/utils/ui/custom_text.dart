import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nasa_flutter/constants/app_constants.dart';

class CustomText extends StatelessWidget {
  String text;
  int? maxLines;
  TextOverflow? overflow;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  TextStyle? textStyle;
  double? fontSize;
  Color? color;

  CustomText({
    Key? key,
    required this.text,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.textStyle,
    this.fontWeight,
    this.fontSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: textStyle ??
          GoogleFonts.poppins(
              fontWeight: fontWeight,
              fontSize: (fontSize ?? 16) * fontRatio,
              color: color),
    );
  }
}
