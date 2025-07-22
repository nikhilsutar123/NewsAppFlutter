import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsWebview extends StatefulWidget {
  const NewsWebview({super.key, this.url});

  final String? url;

  @override
  State<NewsWebview> createState() => _NewsWebviewState();
}

class _NewsWebviewState extends State<NewsWebview> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url!));
  }

  Future<void> handleBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isIOS
          ? AppBar(
              leading: IconButton(
                  onPressed: handleBack,
                  icon: const Icon(Icons.arrow_back_ios)))
          : null,
      body: SafeArea(
        child: Stack(children: [
          WebViewWidget(
            controller: WebViewController()
              ..loadRequest(Uri.parse(widget.url!)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    final openBrowser =
                        await canLaunchUrl(Uri.parse(widget.url!));
                    if (openBrowser) {
                      await launchUrl(Uri.parse(widget.url!),mode: LaunchMode.externalApplication);
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
