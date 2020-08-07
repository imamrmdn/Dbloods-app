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
  final Function validator;

  TextInputField({
    this.hintText,
    this.textInputType,
    this.obscureText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.cursorColor,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: blackTextFont,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      cursorColor: cursorColor,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        //hintStyle: blackTextFont.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
