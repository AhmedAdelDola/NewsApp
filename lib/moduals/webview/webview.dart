import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web extends StatelessWidget {
  final String url ;
  const web({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var webcontroller = WebViewController()..loadRequest(Uri.parse(url))..platform;
    return Scaffold(appBar: AppBar(),
    body:  WebViewWidget(
        controller: webcontroller,
    )
    );
  }
}
