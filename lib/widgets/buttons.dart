import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonA extends StatefulWidget {
  ButtonA(
      {super.key,
      required this.width,
      required this.bgColor,
      required this.borderColor,
      required this.textColor,
      required this.text,
      required this.authenticate});
  final double width;
  var bgColor;
  var borderColor;
  var textColor;
  final String text;
  final Function authenticate;
  bool isDisabled = false;

  @override
  State<ButtonA> createState() => _ButtonAState();
}

class _ButtonAState extends State<ButtonA> {
  @override
  Widget build(BuildContext context) {
    return newElevatedButton(context);
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(color: widget.borderColor))),
          backgroundColor: WidgetStateProperty.all(widget.bgColor),
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        ),
        onPressed: !widget.isDisabled
            ? () async {
                if (!widget.isDisabled) {
                  setState(() => widget.isDisabled = true);
                  await widget.authenticate();
                  setState(() => widget.isDisabled = false);
                }
              }
            : null,
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.w700,
          )),
        ));
  }
}

class UnclickableButton extends StatelessWidget {
  UnclickableButton(
      {super.key,
      required this.text,
      required this.width,
      required this.size,
      required this.fontSize,
      required this.bgColor,
      required this.textColor});
  final String text;
  final double width;
  late var size;
  late var fontSize;
  var bgColor;
  var textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(bgColor),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      ),
      child: Text(
        text,
        style: GoogleFonts.itim(
            textStyle:
                TextStyle(color: textColor, fontSize: fontSize)),
      ),
    );
  }
}

extension on double {
  get width => null;
}
