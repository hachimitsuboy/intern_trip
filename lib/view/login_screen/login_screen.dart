import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Lottie.asset('assets/images/login_image.json')),
          Column(
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'Intern Trip !',
                  style: TextStyle(fontSize: 40, fontFamily: 'LoginFonts'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.6),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () => debugPrint("新規登録ボタン押された"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Center(
                    child: Text('新規登録'),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () => debugPrint("ログインボタン押された"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Center(
                    child: Text('ログイン'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
