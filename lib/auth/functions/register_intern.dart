import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_trip/auth/provider/goal_provider.dart';
import 'package:intern_trip/auth/provider/industry_provider.dart';
import 'package:intern_trip/auth/provider/occupation_provider.dart';
import 'package:intern_trip/auth/provider/schedule_provider.dart';
import 'package:intern_trip/data_models/interm_date.dart';
import 'package:intern_trip/models/database_manager.dart';

void registerIntern(
  WidgetRef ref,
  TextEditingController companyController,
  TextEditingController eventNameController,
  TextEditingController eventContentController,
) {
  final databaseManager = DatabaseManager();
  final intern = Intern(
    company: companyController.text,
    eventName: eventNameController.text,
    eventContents: eventContentController.text,
    startDate: ref.read(startDateProvider),
    endDate: ref.read(endDateProvider),
    industry: ref.read(industryProvider),
    occupation: ref.read(occupationProvider),
    venue: ref.read(goalProvider),
  );
  databaseManager.insertIntern(intern);
  companyController.text = '';
  eventNameController.text = '';
  eventContentController.text = '';
  ref.read(startDateProvider.notifier).state = DateTime.now();
  ref.read(endDateProvider.notifier).state = DateTime.now();
  ref.read(industryProvider.notifier).state = '指定なし';
  ref.read(occupationProvider.notifier).state = '指定なし';
  ref.read(goalProvider.notifier).state = '北海道';
  Fluttertoast.showToast(
    msg: 'インターン情報を登録しました',
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.black45,
  );
}
