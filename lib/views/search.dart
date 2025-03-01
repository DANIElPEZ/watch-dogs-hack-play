import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchView extends StatefulWidget{
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller=WebViewController()..loadRequest(Uri.parse('https://www.google.com'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WebViewWidget(controller: controller));
  }
}