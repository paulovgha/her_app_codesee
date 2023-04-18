class CustomFormFieldValidator {
  CustomFormFieldValidator._();

  static String? validateName(String? value) {
    final validatedName = RegExp(r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$');
    if (value != null && value.isEmpty) {
      return "Required field";
    }
    if (value != null && !validatedName.hasMatch(value)) {
      return "Invalid name, must be at least 2 characters long, including letters and spaces";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final validatedEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "Required field";
    }
    if (value != null && !validatedEmail.hasMatch(value)) {
      return "Invalid e-mail address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final validatedPassword = RegExp(r"^[a-zA-Z0-9]{8,90}$");
    if (value != null && value.isEmpty) {
      return "Required field";
    }
    if (value != null && !validatedPassword.hasMatch(value)) {
      return "Invalid password, must be at least 8 characters long, including numbers and letters, and at least one uppercase letter";
    }
    return null;
  }

  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Required field";
    }
    if (first != second) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? validateNull(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required field";
    }
    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required field";
    }
    if (value.trim().length < 3) {
      return 'Too short, must be at least 3 characters long';
    }
    return null;
  }
}
