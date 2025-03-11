import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialSharingWidget extends StatelessWidget {
  final String url;
  final String title;

  const SocialSharingWidget({
    super.key,
    required this.url,
    this.title = 'Check this out',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        textDirection: TextDirection.rtl, // RTL for Arabic
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'انشرها:',
            style: TextStyle(
              color: Color(0xFF0FB8A9),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              textDirection: TextDirection.rtl, // RTL for Arabic
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSocialIcon(
                  icon: 'copy',
                  onTap: () => _copyToClipboard(context),
                ),
                _buildSocialIcon(
                  icon: 'email',
                  onTap: () => _shareViaEmail(),
                ),
                _buildSocialIcon(
                  icon: 'telegram',
                  onTap: () => _shareViaTelegram(),
                ),
                _buildSocialIcon(
                  icon: 'whatsapp',
                  onTap: () => _shareViaWhatsApp(),
                ),
                _buildSocialIcon(
                  icon: 'linkedin',
                  onTap: () => _shareViaLinkedIn(),
                ),
                _buildSocialIcon(
                  icon: 'twitter',
                  onTap: () => _shareViaTwitter(),
                ),
                _buildSocialIcon(
                  icon: 'facebook',
                  onTap: () => _shareViaFacebook(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({required String icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.string(
          _getSvgString(icon),
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            Color(0xFFE67E22), // Orange color as in the image
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  // Methods to handle sharing
  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: url));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم نسخ الرابط')),
    );
  }

  void _shareViaEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      query: 'subject=$title&body=$url',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  void _shareViaTelegram() async {
    final telegramUrl = 'https://t.me/share/url?url=$url&text=$title';
    final Uri uri = Uri.parse(telegramUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _shareViaWhatsApp() async {
    final whatsappUrl = 'https://api.whatsapp.com/send?text=$title: $url';
    final Uri uri = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _shareViaLinkedIn() async {
    final linkedinUrl =
        'https://www.linkedin.com/sharing/share-offsite/?url=$url';
    final Uri uri = Uri.parse(linkedinUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _shareViaTwitter() async {
    final twitterUrl = 'https://twitter.com/intent/tweet?text=$title&url=$url';
    final Uri uri = Uri.parse(twitterUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _shareViaFacebook() async {
    final facebookUrl = 'https://www.facebook.com/sharer/sharer.php?u=$url';
    final Uri uri = Uri.parse(facebookUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // SVG strings for each icon
  String _getSvgString(String icon) {
    switch (icon) {
      case 'copy':
        return '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M16 1H4C2.9 1 2 1.9 2 3V17H4V3H16V1ZM19 5H8C6.9 5 6 5.9 6 7V21C6 22.1 6.9 23 8 23H19C20.1 23 21 22.1 21 21V7C21 5.9 20.1 5 19 5ZM19 21H8V7H19V21Z"/>
                  </svg>''';
      case 'email':
        return '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M20 4H4C2.9 4 2.01 4.9 2.01 6L2 18C2 19.1 2.9 20 4 20H20C21.1 20 22 19.1 22 18V6C22 4.9 21.1 4 20 4ZM20 8L12 13L4 8V6L12 11L20 6V8Z"/>
                  </svg>''';
      case 'telegram':
        return '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M9.78 18.65L10.06 14.42L17.74 7.5C18.08 7.19 17.67 7.04 17.22 7.31L7.74 13.3L3.64 12C2.76 11.75 2.75 11.14 3.84 10.7L19.81 4.54C20.54 4.21 21.24 4.72 20.96 5.84L18.24 18.65C18.05 19.56 17.5 19.78 16.74 19.36L12.6 16.3L10.61 18.23C10.38 18.46 10.19 18.65 9.78 18.65Z"/>
                  </svg>''';
      case 'whatsapp':
        return '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/>
                  </svg>''';
      case 'linkedin':
        return '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14m-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.32 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93h2.79M6.88 8.56a1.68 1.68 0 0 0 1.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 0 0-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37h2.77z"/>
                  </svg>''';
      case 'twitter':
        return '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                  </svg>''';
      case 'facebook':
        return '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M9.198 21.5h4v-8.01h3.604l.396-3.98h-4V7.5a1 1 0 0 1 1-1h3v-4h-3a5 5 0 0 0-5 5v2.01h-2l-.396 3.98h2.396v8.01Z"/>
                  </svg>''';
      default:
        return '';
    }
  }
}

// Example of how to use this widget
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مشاركة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SocialSharingWidget(
              url: 'https://example.com/your-article',
              title: 'مقال مثير للاهتمام',
            ),
          ],
        ),
      ),
    );
  }
}
