import 'package:intern_trip/data_models/auth_user.dart';
import 'package:riverpod/riverpod.dart';

final inputUserProvider = StateProvider<AuthUser>((ref) {
  return AuthUser(id: "", pass: "");
});