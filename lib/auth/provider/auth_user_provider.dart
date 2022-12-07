import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern_trip/auth/provider/input_user_provider.dart';
import 'package:riverpod/riverpod.dart';

final authUserProvider = FutureProvider((ref) {
  final inputUser = ref.watch(inputUserProvider);
  void login(String id, String pass) async {
    try {
      /// credential にはアカウント情報が記録される
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: id,
        password: pass,
      );
    }

    /// サインインに失敗した場合のエラー処理
    on FirebaseAuthException catch (e) {
      /// メールアドレスが無効の場合
      if (e.code == 'invalid-email') {
        print('メールアドレスが無効です');
      }

      /// ユーザーが存在しない場合
      else if (e.code == 'user-not-found') {
        print('ユーザーが存在しません');
      }

      /// パスワードが間違っている場合
      else if (e.code == 'wrong-password') {
        print('パスワードが間違っています');
      }

      /// その他エラー
      else {
        print('サインインエラー');
      }
    }
  }
});
