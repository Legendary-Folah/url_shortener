import 'package:flutter/material.dart';
import 'package:url_shortener_project/Core/colors.dart';
import 'package:url_shortener_project/Core/form_validation.dart';
import 'package:url_shortener_project/Data/firebase/firebase_service.dart';

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
                  'Link shortener',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsConst.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: linkController,
                    validator: FormValidations.validateDomain,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsConst.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsConst.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    color: ColorsConst.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      String link = linkController.text.trim();
                      final String? validationMessage =
                          FormValidations.validateDomain(link);
                      if (validationMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(validationMessage)),
                        );
                        return;
                      }
                      if (!link.startsWith('http://') &&
                          !link.startsWith('https://')) {
                        link = 'https://$link';
                      }
                      FirebaseService().shortenAndAddUrl(link);

                      print('link: ${linkController.text}');
                    },
                    child: const Text(
                      'Shorten Link',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsConst.white,
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
