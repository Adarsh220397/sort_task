mixin InputValidator {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Enter valid userName ";
    } else if (value.length < 10) {
      return "User name must be 10 characters";
    } else if (value.length > 10) {
      return "User name must be 10 characters";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    RegExp regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-zd$@$!%*?&].{6,}');
    if (value.isEmpty) {
      return "Enter password";
    } else if (!regex.hasMatch(value)) {
      return "Enter password";
    } else if (value.length < 7) {
      return "Enter valid password";
    } else if (value.length > 7) {
      return "Enter valid password";
    } else {
      return null;
    }
  }
}
