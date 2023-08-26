class Validator {

  static requiredValidator(String text) {
    if (text.isEmpty) {
      return "This filed can't be empty";
    } else {
      return null;
    }
  }
}
