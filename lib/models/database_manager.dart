import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern_trip/data_models/app_user.dart';
import 'package:intern_trip/data_models/interm_date.dart';


class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //ユーザ登録
  Future<void> insertUser(AppUser user) async {
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  //取得
  Future<User> getUserInfoFromDbById(String userId) async {
    final query =
    await _db.collection("users").where("userId", isEqualTo: userId).get();
    //わからん userIdを頼りにドキュメントを取ってきているのに、userIdが被ることとかあるのか？一つに定まるのでは？
    //→一つに定まるが、docsはリスト形式のため0番目の要素に取得したいドキュメントが入る
    return User.fromMap(query.docs[0].data());
  }

  //投稿内容をFirestoreに登録しに行く
  Future<void> insertIntern(Intern intern) async {
    await _db.collection("intern").doc(Intern.postId).set(Intern.toMap());
  }

  Future<void> createUserAccount(String id, String pass) async {
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
  Future<void> createCompanyAccount(String id, String pass) async {
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
}