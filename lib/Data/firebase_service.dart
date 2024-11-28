import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String listCollection = 'links';

  Future<bool?> addList(String? link) async {
    try {
      final uuid = const Uuid().v4();
      final date = DateTime.now();
      await _firestore.collection(listCollection).doc(uuid).set({
        'link': link,
        'id': uuid,
        'time': '${date.hour} : ${date.minute}',
      });
      return true;
    } catch (e) {
      print('Error adding link: $e');
      return true;
    }
  }
}
