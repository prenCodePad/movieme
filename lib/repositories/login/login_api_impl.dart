import '../../common/common.dart';
import '../../config/config.dart';
import '../respositories.dart';

class LoginApiImpl extends LoginApi {
  const LoginApiImpl();
  final dio = const BaseDio();
  @override
  Future<String?> login(String username, String password) async {
    try {
      var response = await dio.create().post(
        Constants.loginUrl,
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        StoragePrefs.setStorageValue('name', username);
        StoragePrefs.setStorageValue('token', response.data['token']);
        return null;
      } else {
        return response.data['error'];
      }
    } catch (e) {
      return Constants.somethingWentWrong;
    }
  }

  @override
  Future<String?> signUp(String username, String password) async {
    try {
      var response = await dio.create().post(
        Constants.signupUrl,
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        return null;
      } else {
        return response.data['error'];
      }
    } catch (e) {
      return Constants.somethingWentWrong;
    }
  }
}
