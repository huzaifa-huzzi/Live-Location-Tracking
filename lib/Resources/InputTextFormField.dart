import 'package:flutter/material.dart';


// ignore: must_be_immutable
class InputTextForm extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController myController;
  final FormFieldSetter onfieldSubmitted;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obsecureText;
  bool enable,autofocus ;
  final IconData icondata;

  InputTextForm({super.key,
    required this.myController,
    required this.focusNode,
    required this.onValidator,
    required this.hint,
    required this.keyBoardType,
    required this.obsecureText,
    required this.onfieldSubmitted,
    this.autofocus = false,
    this.enable = true,
    required this.icondata






  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      obscureText: obsecureText,
      controller: myController,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(),
        prefixIcon: Icon(icondata),

      ),
      onFieldSubmitted: onfieldSubmitted,
      validator: onValidator,

    );
  }
}
