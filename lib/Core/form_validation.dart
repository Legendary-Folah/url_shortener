class FormValidations {
  const FormValidations._();

  static String? validateRequiredField(String? value) {
    if (value?.isEmpty ?? true) return 'Field cannot be empty.';
    return null;
  }

  static String? validateDomain(String? value) {
    final domainRegex = RegExp(
        r'^(https?:\/\/)?([\w\-]+\.)+[\w\-]{2,}(\/[\w\-]*)*$',
        caseSensitive: false);
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty.';
    }
    if (!domainRegex.hasMatch(value)) {
      return 'Invalid URL. Please include a valid domain.';
    }
    return null;
  }
}
