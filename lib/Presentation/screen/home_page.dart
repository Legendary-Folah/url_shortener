import 'package:flutter/material.dart';
import 'package:url_shortener_project/Core/colors.dart';
import 'package:url_shortener_project/Presentation/screen/url_home.dart';
import 'package:url_shortener_project/Presentation/screen/url_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void onTap(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.white,
      body: _currentIndex == 0 ? const UrlHome() : const UrlList(),
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.purpleAccent,
        backgroundColor: Colors.black26,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
        ],
      ),
    );
  }
}
