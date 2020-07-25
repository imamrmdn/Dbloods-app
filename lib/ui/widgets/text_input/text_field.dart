part of '../widgets.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;
  final Function onChanged;
  final Widget suffixIcon;

  TextInputField({
    this.hintText,
    this.textInputType,
    this.obscureText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      cursorColor: mainColor,
      decoration: InputDecoration(
        hoverColor: mainColor,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
