import 'package:flutter/material.dart';
import 'package:intern_trip/auth/functions/lgin.dart';
import 'package:intern_trip/view/common_widgets/common_button.dart';
import 'package:intern_trip/view/start_screen/children/auth_text_form_field.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // buildメソッドで定義すると、入力内容が消える
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              const Divider(
                thickness: 0.5,
                color: Colors.black54,
              ),
              const SizedBox(height: 20),
              const Center(
                  child: Text(
                'ログイン',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Lottie.asset('assets/images/login_image.json'),
                ),
              ),
              authTextFormField(
                title: 'メールアドレス',
                controller: _idController,
              ),
              const SizedBox(height: 30),
              authTextFormField(
                title: 'パスワード',
                controller: _passController,
                obscure: true,
              ),
              const SizedBox(height: 50),
              CommonButton(
                title: '送信',
                onPush: () => login(
                  _idController.text,
                  _passController.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
