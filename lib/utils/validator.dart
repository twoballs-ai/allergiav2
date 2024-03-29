class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+[a-zA-Z0-9\._-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '❗Пожалуйста введите правильный почтовый адрес.';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return '❗Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '❗Пароль должен содержать минимум 6 символов';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 3) {
      return '❗ Имя пользователя слишком короткое';
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return '❗ Поле не может быть пустым.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.length != 11) {
      return '❗ Phone number is not valid.';
    } else {
      return null;
    }
  }
}
