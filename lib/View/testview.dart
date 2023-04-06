import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyHomePage extends StatelessWidget {

  static const List<String> _urls = [
    "https://www.2embed.to/embed/tmdb/movie?id=718930"
  ];

  Stream<String> get _rawHtml  async* {
    int i = 0;
    while(true) {
      await Future.delayed(const Duration(seconds: 3),);
      int _index = i;
      i = i<(_urls.length-1) ? i+=1 : 0;
      yield _urls[_index];
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: StreamBuilder<String>(
        stream: _rawHtml ,
        builder: (BuildContext context, AsyncSnapshot snapshot) => !snapshot.hasData
            ? Center(child: CircularProgressIndicator(),)
            : WebView(
          onWebViewCreated: (WebViewController _controller) => _controller.loadUrl(
            Uri.dataFromString(
                snapshot.data,
                mimeType: 'text/html',
                encoding: Encoding.getByName('utf-8')
            ).toString(),
          ),
        ),
      ),
    ),
  );
}