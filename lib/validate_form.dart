class ValidateForm {
  static String? validateEmail(String? email) {
    if (email != null && email.isEmpty) {
      return 'Email is required';
    } else if (email != null && !email.contains('@')) {
      return 'Enter valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password != null && password.isEmpty) {
      return 'Password is required';
    } else if (password != null && password.length < 8) {
      return 'Password must be at least 8 character long';
    }
  }
}
