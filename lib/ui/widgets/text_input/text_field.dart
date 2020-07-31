part of '../widgets.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;
  final Function onChanged;
  final Widget suffixIcon;
  final Color cursorColor;
  final String labelText;

  TextInputField({
    this.hintText,
    this.textInputType,
    this.obscureText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.cursorColor,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: blackTextFont,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        //hintStyle: blackTextFont.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
