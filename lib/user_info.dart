import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info.g.dart';

@riverpod
class UserInfo extends _$UserInfo {
  @override
  Map build() {
    return {'email': '', 'password': ''};
  }

  void updateEmail(String email) {
    state['email'] = email;
  }

  void updatePassword(String password) {
    state['password'] = password;
  }

  void updateUserInfo(String email, String password) {
    updateEmail(email);
    updatePassword(password);
  }
}
