import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_trip/data_models/app_user.dart';
import 'package:intern_trip/data_models/intern_data.dart';
import 'package:intern_trip/functions/to_home_or_company_screen.dart';
import 'package:intern_trip/utils/constants.dart';
import 'package:intern_trip/view/company_screen/company_screen.dart';
import 'package:intern_trip/view/home_screen/home_screen.dart';
import 'package:uuid/uuid.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //ユーザ登録
  Future<void> insertUser(AppUser user) async {
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  Future<List<Intern>> getInternInfo(
    String goal,
    DateTime departureDate,
    String industry,
    String occupation,
  ) async {
    List<Intern> allInternList = [];
    List<Intern> resultInternList = [];

    QuerySnapshot<Map<String, dynamic>> query =
        await getQuery(industry, occupation, goal);

    for (var element in query.docs) {
      allInternList.add(Intern.fromMap(element.data()));
    }

    resultInternList = checkDate(allInternList, departureDate);

    return resultInternList;
  }

  List<Intern> checkDate(List<Intern> allInternList, DateTime departureDate) {
    final List<Intern> internList = [];
    for (var intern in allInternList) {
      final possibleDates = [
        intern.startDate.add(const Duration(days: 1) * -1),
        intern.startDate.add(const Duration(days: 2) * -1),
        intern.startDate.add(const Duration(days: 3) * -1),
        intern.endDate.add(const Duration(days: 1)),
        intern.endDate.add(const Duration(days: 2)),
        intern.endDate.add(const Duration(days: 3)),
      ];
      for (var possibleDate in possibleDates) {
        if (departureDate == possibleDate) {
          internList.add(intern);
        }
      }
    }
    return internList;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getQuery(
    String industry,
    String occupation,
    String goal,
  ) async {
    QuerySnapshot<Map<String, dynamic>> query;

    if (industry == '指定なし') {
      if (occupation == '指定なし') {
        // 業種・職種どちらも指定なし
        query = await _db
            .collection('intern')
            .where('venue', isEqualTo: goal)
            .get();
      } else {
        // 職種のみ指定
        query = await _db
            .collection('intern')
            .where('venue', isEqualTo: goal)
            .where('occupation', isEqualTo: occupation)
            .get();
      }
    } else if (occupation == '指定なし') {
      // 業種のみ指定
      query = await _db
          .collection('intern')
          .where('venue', isEqualTo: goal)
          .where('industry', isEqualTo: industry)
          .get();
    } else {
      // 業種・職種どちらも指定
      query = await _db
          .collection('intern')
          .where('venue', isEqualTo: goal)
          .where('industry', isEqualTo: industry)
          .where('occupation', isEqualTo: occupation)
          .get();
    }
    return query;
  }

  //投稿内容をFirebaseに登録しに行く
  Future<void> insertIntern(Intern intern) async {
    // TODO 現在はとりあえず企業側のクラスを無視する
    final docId = const Uuid().v1();
    await _db.collection('intern').doc(docId).set(intern.toMap());
  }

  Future<void> createAccount(
      String id, String pass, BuildContext context, UserType userType) async {
    try {
      // credential にはアカウント情報が記録される
      if (id != '') {
        if (pass != '') {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: id,
            password: pass,
          );
          Fluttertoast.showToast(
            msg: '登録完了',
            toastLength: Toast.LENGTH_LONG,
          );
          if (UserType == UserType.user) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => CompanyScreen()));
          }
        } else {
          Fluttertoast.showToast(
            msg: 'パスワードが入力されていません',
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 2,
          );
        }
      } else if (pass != '') {
        Fluttertoast.showToast(
          msg: 'メールアドレスが入力されていません',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 2,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'メールアドレス・パスワードが入力されていません',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 2,
        );
      }
    }

    // アカウントに失敗した場合のエラー処理
    on FirebaseAuthException catch (e) {
      // パスワードが弱い場合
      if (e.code == 'weak-password') {
        debugPrint('パスワードが弱いです');

        // メールアドレスが既に使用中の場合
      } else if (e.code == 'email-already-in-use') {
        debugPrint('すでに使用されているメールアドレスです');
      }

      // その他エラー
      else {
        debugPrint('アカウント作成エラー');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> login(
      String id, String pass, BuildContext context, UserType userType) async {
    try {
      if (id != '') {
        if (pass != '') {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: id,
            password: pass,
          );
          Fluttertoast.showToast(
            msg: 'ログイン完了',
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 2,
          );
          toHomeOrCompanyScreen(userType, context);
        } else {
          Fluttertoast.showToast(
            msg: 'パスワードが入力されていません',
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 2,
          );
        }
      } else if (pass != '') {
        Fluttertoast.showToast(
          msg: 'メールアドレスが入力されていません',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 2,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'メールアドレス・パスワードが入力されていません',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 2,
        );
      }
      // credential にはアカウント情報が記録される

    }
    // サインインに失敗した場合のエラー処理
    on FirebaseAuthException catch (e) {
      // メールアドレスが無効の場合
      if (e.code == 'invalid-email') {
        debugPrint('メールアドレスが無効です');
      }
      // ユーザーが存在しない場合
      else if (e.code == 'user-not-found') {
        debugPrint('ユーザーが存在しません');
      }
      // パスワードが間違っている場合
      else if (e.code == 'wrong-password') {
        debugPrint('パスワードが間違っています');
      }
      // その他エラー
      else {
        debugPrint('サインインエラー');
      }
    }
  }
}
