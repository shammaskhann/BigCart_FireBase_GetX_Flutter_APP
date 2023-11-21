import 'package:firebase_storage/firebase_storage.dart';

import '../../utils/utils.dart';

class FireStoreImageServices {
  Future<String> getImage(String imagePath) async {
    final storage = FirebaseStorage.instance;
    try {
      final ref = storage.ref().child(imagePath);
      final String url = await ref.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      Utils.snackBar('Error', 'Error while fetching image');
      print(e);
      return "";
    }
  }
}
