import 'package:firebase_auth/firebase_auth.dart';

void createAccount(String id, String pass) async {
  try {
    /// credential にはアカウント情報が記録される
    final credential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: id,
      password: pass,
    );
  }

  /// アカウントに失敗した場合のエラー処理
  on FirebaseAuthException catch (e) {
    /// パスワードが弱い場合
    if (e.code == 'weak-password') {
      print('パスワードが弱いです');

      /// メールアドレスが既に使用中の場合
    } else if (e.code == 'email-already-in-use') {
      print('すでに使用されているメールアドレスです');
    }

    /// その他エラー
    else {
      print('アカウント作成エラー');
    }
  } catch (e) {
    print(e);
  }
}