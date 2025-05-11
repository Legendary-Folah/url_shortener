class FormValidations {
  const FormValidations._();

  static String? validateRequiredField(String? value) {
    if (value?.isEmpty ?? true) return 'Field cannot be empty.';
    return null;
  }

  static String? validateDomain(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty.';
    }
    final fullUrlRegex = RegExp(
      r'^(https?://)?([\w\-]+\.)+[\w\-]{2,}(/[\w\-]*)*$',
      caseSensitive: false,
    );
    if (!fullUrlRegex.hasMatch(value)) {
      return 'Invalid URL. Ensure it starts with http:// or https://';
    }

    return null;
  }
}
