import 'package:url_launcher/url_launcher.dart';

class ExternalServices {
  ExternalServices._();

  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrl(Uri.https(url))) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
