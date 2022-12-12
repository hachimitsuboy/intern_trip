import 'package:riverpod/riverpod.dart';

final departureDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final departureDateToStringProvider = StateProvider<String>((ref) {
  final nowDate = ref.watch(departureDateProvider);
  return '${nowDate.year}年${nowDate.month}月${nowDate.day}日';
});