import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_shortener_project/Core/colors.dart';
import 'package:url_shortener_project/Data/external_services.dart';
import 'package:url_shortener_project/Data/firebase/firebase_service.dart';

class UrlList extends StatefulWidget {
  const UrlList({super.key});

  @override
  State<UrlList> createState() => _UrlListState();
}

class _UrlListState extends State<UrlList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: StreamBuilder(
            stream: FirebaseService().streamLinks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final linkList = FirebaseService().getLinks(snapshot);
              return ListView.builder(
                itemCount: linkList.length,
                itemBuilder: (context, index) {
                  final link = linkList[index];
                  return Column(
                    children: [
                      Dismissible(
                          background: Container(
                            color: ColorsConst.green,
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: ColorsConst.white,
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (DismissDirection direction) {
                            FirebaseService().delete(link.id);
                            print('Deleted : ${link.link}, ${link.id}');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorsConst.grey),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '${link.link}',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            ExternalServices.launchUrl(
                                                link.link);
                                            print('Launched ${link.link}');
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //   link.link,
                                //   style: const TextStyle(fontSize: 18),
                                // ),
                                const SizedBox(height: 20),
                                Text(
                                  'Time Added: ${link.time}',
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 15),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
