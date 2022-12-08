import 'package:riverpod/riverpod.dart';

final goalProvider = StateProvider<String>((ref) {
  return '北海道';
});