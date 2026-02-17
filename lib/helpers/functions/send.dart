import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail(String email) async {
  final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email);

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  }
}

Future<void> launchPhone(String phone) async {
  final Uri telUri = Uri(scheme: 'tel', path: phone);

  if (await canLaunchUrl(telUri)) {
    await launchUrl(telUri);
  }
}

Future<void> openSocial(String socialUrl) async {
  final Uri socialUri = Uri.parse(socialUrl);
  if (await canLaunchUrl(socialUri)) {
    await launchUrl(socialUri, mode: LaunchMode.externalApplication);
  }
}
