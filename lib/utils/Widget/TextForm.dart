import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final bool obscure;
  final bool enabled;
  const TextForm({super.key, required this.textEditingController, required this.obscure, required this.hint, required this.enabled});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: textEditingController,
      enabled: enabled,
      obscureText: obscure,
      style: TextStyle(color: enabled?Colors.black:Colors.grey,fontSize: 15),
      maxLines: 1,
      decoration: InputDecoration(
        errorMaxLines: 1,
        hintText: hint,
        hintStyle: const TextStyle(fontWeight: FontWeight.normal,color: Colors.grey,fontSize: 16,fontFamily: 'Inter',),
      ),
    );
  }
}