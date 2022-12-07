import 'package:flutter/material.dart';
import 'package:intern_trip/view/start_screen/login_screen/login_screen.dart';
import 'package:intern_trip/view/start_screen/sign_up_screen/sign_up_screen.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Lottie.asset('assets/images/start_image.json')),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: const Center(
                    child: Text('新規登録'),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Center(
                    child: Text('ログイン'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
