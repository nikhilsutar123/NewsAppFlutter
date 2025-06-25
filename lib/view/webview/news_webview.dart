import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebview extends StatelessWidget {
  const NewsWebview({super.key, this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          WebViewWidget(
            controller: WebViewController()..loadRequest(Uri.parse(url!)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async{

                    final openBrowser = await canLaunchUrl(Uri.parse(url!));
                    if(openBrowser){
                      await launchUrl(Uri.parse(url!));
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.open_in_browser),
                      Text(
                        "Open in browser",
                        style: textThemeBlack(14),
                      ),
                    ],
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
