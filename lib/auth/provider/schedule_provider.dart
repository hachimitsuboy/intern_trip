import 'package:riverpod/riverpod.dart';

final startDateProvider = StateProvider<String>((ref) {
  final nowDate = DateTime.now();
  return '${nowDate.year}年${nowDate.month}月${nowDate.day}日';
});


final endDateProvider = StateProvider<String>((ref) {
  final nowDate = DateTime.now();
  return '${nowDate.year}年${nowDate.month}月${nowDate.day}日';
});