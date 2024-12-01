import 'package:flutter/material.dart';
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
                  return ListTile(
                    title: Text(
                      link.link,
                      style: const TextStyle(fontSize: 24),
                    ),
                    subtitle: Text(link.time),
                  );
                },
              );
            }),
      ),
    );
  }
}
