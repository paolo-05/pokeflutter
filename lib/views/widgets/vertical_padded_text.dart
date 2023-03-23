import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalPaddedText extends StatelessWidget {
  final String content;
  final TextStyle? textStyle;
  final int textSize;
  final int textSizewithPadding;
  final TextAlign? textAlign;

  const VerticalPaddedText({
    required this.content,
    required this.textStyle,
    required this.textSize,
    required this.textSizewithPadding,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ((textSizewithPadding - textSize) / 2).h),
      child: Text(
        content,
        textAlign: textAlign,
        style: textStyle,
      ),
    );
  }
}
