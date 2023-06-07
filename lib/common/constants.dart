import 'dart:io';

class Constants {
  static final String host = Platform.isIOS ? 'http://localhost:3000' : 'http://10.0.2.2:3000';
  static final String loginUrl = '$host/login';
  static final String signupUrl = '$host/register';
  static final String movieUrl = '$host/movies';

  static const String logo = 'MovieMe!';
  static const String username = 'Username';
  static const String password = 'Password';
  static const String logginIn = 'Logging In...';
  static const String login = 'Login';
  static const String loginSuccessful = 'Login Successful';
  static const String or = '-- Or --';
  static const String signingUp = 'Signing Up...';
  static const String signUp = 'Sign Up';
  static const String signUpSuccessful = 'User Created Successfully, Please login to continue';
  static const String loginSignUpClarification =
      'After providing the credentials, if you are an existing user click Login to continue. If not, click on Sign Up to create your account with provided credentials';

  static const String rateMovies = 'Rate your favourite movies!';
  static const String recommendationQuote = 'Get your taste-tailored recommendations right away!!';

  static const String searchTitle = 'Search for a title';
  static const String somethingWentWrong = 'Something Went Wrong';
}
