import 'package:flutter/material.dart';

//This Class to create custom text.
class CustomText extends StatelessWidget {
  final String? text;
  final double? height,
      width,
      heightText,
      margin,
      marginTop,
      marginBottom,
      marginEnd,
      marginStart;

  final double? fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final bool? underLine, bold;
  final AlignmentDirectional? alignment;
  final TextDirection? textDirection;
  final VoidCallback? onPressed;
  final String? fontFamily;

  const CustomText(
      {Key? key,
      this.height,
      this.textDirection,
      this.alignment,
      this.bold,
      this.onPressed,
      this.width,
      this.textAlign,
      this.margin,
      this.marginTop,
      this.marginBottom,
      this.marginEnd,
      this.marginStart,
      this.text,
      this.fontSize,
      this.textColor,
      this.heightText,
      this.fontFamily,
      this.underLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin != null
          ? EdgeInsetsDirectional.all(margin!)
          : EdgeInsetsDirectional.only(
              top: marginTop != null ? marginTop! : 0,
              bottom: marginBottom != null ? marginBottom! : 0,
              end: marginEnd != null ? marginEnd! : 0,
              start: marginStart != null ? marginStart! : 0,
            ),

      //Set button in size box and given width, height.
      child: SizedBox(
        width: width,
        height: height,
        child: Align(
          alignment: alignment ?? AlignmentDirectional.topStart,
          child: GestureDetector(
            //execute function when pressed.
            onTap: onPressed,
            child: Text(
              text ?? "",
              //Modify text style.
              textAlign: textAlign,
              textDirection: textDirection,
              style: TextStyle(
                fontWeight: bold != null ? FontWeight.bold : FontWeight.normal,
                decoration: underLine != null
                    ? TextDecoration.underline
                    : TextDecoration.none,
                fontSize: fontSize,
                height: heightText,
                fontFamily: fontFamily,
                color: textColor ?? Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
