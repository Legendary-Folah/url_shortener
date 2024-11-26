import 'package:flutter/material.dart';

class UrlHome extends StatefulWidget {
  const UrlHome({super.key});

  @override
  State<UrlHome> createState() => _UrlHomeState();
}

class _UrlHomeState extends State<UrlHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Url_home'),
      ),
    );
  }
}
