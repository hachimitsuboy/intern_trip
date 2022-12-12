import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/auth/functions/to_home_or_company_screen.dart';
import 'package:intern_trip/models/database_manager.dart';
import 'package:intern_trip/utils/constants.dart';
import 'package:intern_trip/view/common_widgets/common_button.dart';
import 'package:intern_trip/view/start_screen/children/auth_text_form_field.dart';
import 'package:intern_trip/view/start_screen/sign_up_screen/sign_up_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends ConsumerWidget {
  final UserType userType;

  LoginScreen({
    super.key,
    required this.userType,
  });

  // buildメソッドで定義すると、入力内容が消える
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final DatabaseManager _databaseManager = DatabaseManager();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onPush: () {
                  _databaseManager.login(
                      _idController.text, _passController.text);
                  toHomeOrCompanyScreen(userType, context);
                },
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: (userType == UserType.company)
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(
                                  userType: UserType.company,
                                ),
                              ),
                            );
                          },
                          child: const Center(
                            child: Text(
                              '新規登録はこちら',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
