import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  String title;
  TextEditingController controller;

  SignUpTextFormField({
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(title),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        controller: controller,
        obscureText: true,
      ),
    );
  }
}
