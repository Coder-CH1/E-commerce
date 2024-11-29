import 'package:flutter/material.dart';

/// CUSTOM COLORS
const whiteColor = Colors.white;

const blueColor = Colors.blue;

const blackColor = Colors.black;

const darkBlue = Color(0xff090088);

const lightBlue = Color(0xff77aaff);

const splashColor = Color(0xffDB3022);

const titleAppBarColor = Color(0xff222222);

const opacityWhite = Color(0xffF9F9F9);

const redColor = Color(0xffDB3022);

/// CUSTOM BUTTON
class CustomButton extends StatelessWidget {
  final String text;
  final Widget? navigatorDestination;
  final Function() onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? color;
  final TextStyle? buttonTextStyle;
  final BorderSide? side;
  final double? borderRadius;
  const CustomButton(
      {super.key,
        required this.text,
        required this.onPressed,
        this.navigatorDestination,
        this.buttonWidth,
        this.buttonHeight,
        this.buttonTextStyle,
        this.side,
        this.borderRadius,
        required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 12),
      side: side ?? BorderSide.none,
      ),
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

/// CUSTOM TEXT
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;
  final int maxLines;
  final TextOverflow overFlow;
  const CustomText({super.key,
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

/// CUSTOM TEXTFIELD
class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomTextField({super.key, this.labelText, this.hintText, this.obscureText = false, this.keyboardType, this.controller});

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

/// CUSTOM APPBAR
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Color? background;
  final TextStyle? textStyle;
  const CustomAppBar({super.key, required this.title, this.leading, this.background, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: textStyle),
      leading: leading ?? IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp)
      ),
      backgroundColor: background,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

/// CUSTOM TEXTBUTTON
class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final TextStyle? buttonTextStyle;
  final Function() onPressed;
  const CustomTextButton({super.key, required this.text, required this.onPressed, this.color, this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        onPressed: onPressed,
        text: '');
  }
}

/// CUSTOM LISTVIEW
class CustomListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  const CustomListView({super.key, required this.items, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: items.length,
      itemBuilder: (context, index) {
      return itemBuilder(context, items[index]);
      }
    );
  }
}

















