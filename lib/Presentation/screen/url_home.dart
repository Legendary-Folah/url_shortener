import 'package:flutter/material.dart';
import 'package:url_shortener_project/Core/colors.dart';

class UrlHome extends StatefulWidget {
  const UrlHome({super.key});

  @override
  State<UrlHome> createState() => _UrlHomeState();
}

class _UrlHomeState extends State<UrlHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsConst.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Link shortener...',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  // style: const ButtonStyle(
                  //   minimumSize: WidgetStatePropertyAll<Size>(),
                  // ),
                  child: const Text('SHorten Link'),
                )
              ],
            ),
          ),
        ));
  }
}
