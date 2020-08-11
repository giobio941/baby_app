import 'dart:async';
import 'package:Baby/ualabel.dart';
import 'package:Baby/uatheme.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class yomingoPage extends StatefulWidget {
  final String url;

  yomingoPage({this.url});

  @override
  _yomingoPage createState() => _yomingoPage();
}

class _yomingoPage extends State<yomingoPage> {
  Completer<WebViewController> _controller = new Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    UATheme.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyYomingo'),
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
