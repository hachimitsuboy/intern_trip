import 'package:riverpod/riverpod.dart';

final occupationProvider = StateProvider<String>((ref) {
  return '指定なし';
});