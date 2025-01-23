import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../networking/constants.dart';

class Share extends StatelessWidget {
  const Share({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            share(SocialMedia.facebook);
          },
          icon: FaIcon(Icons.facebook),
        ),
        IconButton(
          onPressed: () {
            share(SocialMedia.whatsapp);
          },
          icon: FaIcon(FontAwesomeIcons.whatsapp),
        ),
        IconButton(
          onPressed: () async {
            await share(SocialMedia.email);
          },
          icon: FaIcon(Icons.email),
        ),
        IconButton(
          onPressed: () {
            share(SocialMedia.twitter);
          },
          icon: FaIcon(FontAwesomeIcons.twitter),
        ),
        IconButton(
          onPressed: () {
            share(SocialMedia.linkedin);
          },
          icon: FaIcon(FontAwesomeIcons.linkedin),
        ),
      ],
    );
  }

  Future share(SocialMedia socialMedia) async {
    final subject = 'dasdasdasd';
    final text = 'asdasdasd';
    final urlShare = Uri.encodeComponent('component');
    final urls = {
      SocialMedia.facebook:
      'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter:
      'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.email: 'mailto:?subject=$subject&body=$text\n\n$urlShare',
      SocialMedia.linkedin:
      'https://www.linkedin.com/shareArticle?mini=true&url=$urlShare',
      SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$text$urlShare',
    };
    final url = urls[socialMedia]!;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
