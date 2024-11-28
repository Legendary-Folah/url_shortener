import 'package:flutter/material.dart';
import 'package:url_shortener_project/Core/colors.dart';

class UrlHome extends StatefulWidget {
  const UrlHome({super.key});

  @override
  State<UrlHome> createState() => _UrlHomeState();
}

TextEditingController linkController = TextEditingController();

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
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: linkController,
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 22,
                  decoration: BoxDecoration(
                    color: ColorsConst.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Shorten Link',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
