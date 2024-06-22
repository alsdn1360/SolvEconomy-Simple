import 'package:flutter/material.dart';
import 'package:solveconomy_simple/general_widget/general_progress_indicator.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  final String newsUrl;

  const NewsPage({
    super.key,
    required this.newsUrl,
  });

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => isLoading = false);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://news.naver.com/section/101')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.newsUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            if (isLoading) const Center(child: GeneralProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
