import 'package:flutter/material.dart';
import 'package:intern_trip/view/common_widgets/common_button.dart';
import 'package:intern_trip/view/sign_up_screen/children/sign_up_text_form_field.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _idController = TextEditingController();
    TextEditingController _passController = TextEditingController();

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
                '新規登録',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Lottie.asset('assets/images/sign_up_image.json'),
                ),
              ),
              SignUpTextFormField(title: 'メールアドレス', controller: _idController),
              const SizedBox(height: 30),
              SignUpTextFormField(title: 'パスワード', controller: _passController),
              const SizedBox(height: 50),
              CommonButton(title: '送信', onPush: () => debugPrint('送信')),
            ],
          ),
        ),
      ),
    );
  }
}
