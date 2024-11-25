import 'package:flutter/material.dart';

/// CUSTOM COLORS
const whiteColor = Colors.white;

const blueColor = Colors.blue;

const blackColor = Colors.black;

const darkBlue = Color(0xff090088);

const lightBlue = Color(0xff77aaff);

const splashColor = Color(0xffDB3022);

/// CUSTOM BUTTON
class Button extends StatelessWidget {
  final String text;
  final Widget? navigatorDestination;
  final Function() onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? color;
  final TextStyle? buttonTextStyle;
  final BorderSide? side;
  const Button(
      {super.key,
        required this.text,
        required this.onPressed,
        this.navigatorDestination,
        this.buttonWidth,
        this.buttonHeight,
        this.buttonTextStyle,
        this.side,
        required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      height: buttonHeight ?? 40,
      minWidth: buttonWidth ?? 250,
      color: color,
      onPressed: onPressed,
      child: Text(text, style: buttonTextStyle
        //const TextStyle(
        // fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}

/// CUSTOM TEXTFIELD
class DefaultTextField extends StatefulWidget {
  final String labelText;
  final bool isRequired;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String hintTextt;
  final bool isObscured;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;

  const DefaultTextField(
      {super.key,
        required this.labelText,
        required this.hintTextt,
        this.isRequired = false,
        this.controller,
        this.keyboardType = TextInputType.text,
        this.isObscured = false,
        this.hintStyle,
        this.onChanged});

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool _obscuredText = true;

  @override
  void initState() {
    super.initState();
    _obscuredText = widget.isObscured;
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.labelText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            children: widget.isRequired
                ? [
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ]
                : [],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: _obscuredText,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintTextt,
            hintStyle: widget.hintStyle,
            suffixIcon: widget.isObscured
                ? IconButton(
              icon: Icon(
                _obscuredText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscuredText = !_obscuredText;
                });
              },
            )
                : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}


/// CUSTOM TEXT
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;
  final int maxLines;
  final TextOverflow overFlow;
  CustomText({
    required this.text,
    required this.style,
    this.align = TextAlign.start,
    this.maxLines = 1,
    this.overFlow = TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overFlow,
    );
  }
}

/// CUSTOM TEXTFIELD2
class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomTextField({Key? key, this.labelText, this.hintText, this.obscureText = false, this.keyboardType, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}





















