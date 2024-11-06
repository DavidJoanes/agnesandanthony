import 'package:url_launcher/url_launcher.dart';

class RouteTo {
  RouteTo._();
  static Future<void> openTab(website) async {
    if (await canLaunchUrl(Uri.parse(website))) {
      await launchUrl(Uri.parse(website));
    } else {
      throw "Invalid URL: $website";
    }
  }
}