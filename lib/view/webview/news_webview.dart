import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebview extends StatelessWidget {
  const NewsWebview({super.key, this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(url!)),
      ),
    );
  }
}
