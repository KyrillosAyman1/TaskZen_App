import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> saveImagePermanently(String imagePath) async {
  final directory = await getApplicationDocumentsDirectory();
  final name = DateTime.now().millisecondsSinceEpoch.toString();
  final newImage = File('${directory.path}/$name.png');
  return File(imagePath).copy(newImage.path).then((file) => file.path);
}
