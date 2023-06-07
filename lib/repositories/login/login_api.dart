abstract class LoginApi {
  const LoginApi();
  Future<String?> login(String username, String password);
  Future<String?> signUp(String username, String password);
}
