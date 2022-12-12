import 'package:riverpod/riverpod.dart';

final startDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final endDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final startDateToStringProvider = StateProvider<String>((ref) {
  final startDate = ref.watch(startDateProvider);
  return '${startDate.year}年${startDate.month}月${startDate.day}日';
});

final endDateToStringProvider = StateProvider<String>((ref) {
  final endDate = ref.watch(endDateProvider);
  return '${endDate.year}年${endDate.month}月${endDate.day}日';
});
