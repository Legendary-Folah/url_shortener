class ExternalServices {
  ExternalServices._();

  static Future<void> launchUrl(String url) async {
    // final uri = Uri.https(url);
    await launchUrl(url);
  }
}
