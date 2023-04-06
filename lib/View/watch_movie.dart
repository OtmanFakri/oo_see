import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Watch extends StatefulWidget {

  String ID;


  Watch(this.ID);

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {

  @override
  Widget build(BuildContext context) {
    WebViewController controller;
    return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: WebView(
              onWebViewCreated: (controller1) async {
                controller = controller1;
                await loadHtmlFromAssets('legal/privacy_policy.html', controller);
              },
              navigationDelegate: (NavigationRequest request)async {
                //await fetchUserOrder();
                return NavigationDecision.prevent;
              } ,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: " https://vidsrc.me/embed/"+this.widget.ID+"/",

            ),
          ),
        )
    );
  }

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(
        fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  Future<String> fetchUserOrder() {
    // Imagine that this function is more complex.
    var str = Future.delayed(
        const Duration(seconds: 60),
            () => throw 'Cannot locate user order');
    return str;
  }
}