import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final bool obscure;
  const TextForm({super.key, required this.textEditingController, required this.obscure, required this.hint});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: textEditingController,
      // validator: (value) => validateText(value!),
      obscureText: obscure,
      style: const TextStyle(color: Colors.black,fontSize: 15),
      maxLines: 1,
      decoration: InputDecoration(
        errorMaxLines: 1,
        hintText: hint,
        hintStyle: const TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 15,),
      ),
    );
  }
}