import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static url(String url) async {
    // ignore: unnecessary_null_comparison
    if (canLaunchUrl(url as Uri) != null) {
      launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}