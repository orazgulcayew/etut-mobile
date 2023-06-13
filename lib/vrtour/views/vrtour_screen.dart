import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VrTourScreen extends StatelessWidget {
  const VrTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('http://172.16.0.71/360/'));

    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
