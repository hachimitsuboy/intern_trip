import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  String title;
  VoidCallback onPush;

  CommonButton({
    super.key,
    required this.title,
    required this.onPush,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ElevatedButton(
          onPressed: onPush,
          child: Center(
            child: Text(title, style: const TextStyle(fontSize: 16),),
          ),
        ),
      ),
    );
  }
}
