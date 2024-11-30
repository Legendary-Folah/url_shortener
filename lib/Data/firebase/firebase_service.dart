import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_shortener_project/Core/constants.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class FirebaseService {
  FirebaseService._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String listCollection = 'links';

  Future<String> shortenURL(String longUrl) async {
    String accessToken = Constants.bitlyAccess;
    String apiUrl = Constants.apiUrl;
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          'long_url': longUrl,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String shortenedUrl = responseData['link'];
        return shortenedUrl;
      } else {
        print('Failed to shorten URL: ${response.statusCode}');
        return longUrl;
      }
    } catch (e) {
      print('Error shortening URL: $e');
      return longUrl;
    }
  }

  Future<bool?> addList(String? shortenLink) async {
    try {
      final uuid = const Uuid().v4();
      final date = DateTime.now();
      await _firestore.collection(listCollection).doc(uuid).set({
        'link': shortenLink,
        'id': uuid,
        'time': '${date.hour} : ${date.minute} ${date.hour > 12 ? 'pm' : 'am'}',
      });
      return true;
    } catch (e) {
      print('Error adding link: $e');
      return false;
    }
  }

  Future<bool?> shortenAndAddUrl(String longUrl) async {
    try {
      final String shortenedUrl = await shortenURL(longUrl);
      final bool? isAdded = await addList(shortenedUrl);

      if (isAdded == true) {
        print('Added shortened Url successfully');
      } else {
        print('Error adding shortened Url successfully');
      }
      return true;
    } catch (e) {
      print('Error in shortenAndAddURL: $e');
      return false;
    }
  }
}
