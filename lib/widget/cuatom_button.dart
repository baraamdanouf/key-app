import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:key_app/utils/const_colors.dart';

//This Class to create custom button.
class CustomButton extends StatelessWidget {
  final double? width, height, widthBorder, border, textSize;
  final Color? backgroundColor, borderColor, textColor;
  final String? text, fontFamily;
  final VoidCallback onPressed;
  final bool? bold;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.width,
    this.borderColor,
    this.widthBorder,
    this.textColor,
    this.border,
    this.height,
    this.fontFamily,
    this.bold = false,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set button in size box and given width, height.
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        //execute function when pressed.
        onPressed: onPressed,
        //Modify button style
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border!.r),
              side: BorderSide(
                color: borderColor != null ? borderColor! : Colors.transparent,
                width: widthBorder != null ? widthBorder! : 0,
              ))),
          backgroundColor: backgroundColor != null
              ? MaterialStateProperty.all(backgroundColor)
              : MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          text ?? "",
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
