import 'dart:async';
import 'package:Baby/ualabel.dart';
import 'package:Baby/uatheme.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  final String url;

  PrivacyPolicy({this.url});

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  Completer<WebViewController> _controller = new Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    UATheme.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Statement'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _controller.future.then((value) => value.reload());
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
