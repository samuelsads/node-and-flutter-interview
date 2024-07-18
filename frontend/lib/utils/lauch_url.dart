


import 'package:url_launcher/url_launcher.dart';

class LauchUrl{
    void LaunchUrl(Uri url,
      {LaunchMode lauchMode = LaunchMode.platformDefault}) async {
    if (!await launchUrl(url, mode: lauchMode)) {
      throw 'Could not launch $url';
    }
  }
}