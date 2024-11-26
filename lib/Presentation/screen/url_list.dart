import 'package:flutter/material.dart';

class UrlList extends StatefulWidget {
  const UrlList({super.key});

  @override
  State<UrlList> createState() => _UrlListState();
}

class _UrlListState extends State<UrlList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Url_list'),
      ),
    );
  }
}
