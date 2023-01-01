class ValidatorUtils {
  ValidatorUtils._();

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  static bool isValidUserName(String userName) {
    return userName.length >= 3;
  }
}
