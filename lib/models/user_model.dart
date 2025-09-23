
import 'package:hive/hive.dart';
 part 'user_model.g.dart';
@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
   String name;
  @HiveField(1)

   String imageUrl;
  @HiveField(2)
   bool isDarkMode;
  @HiveField(3)
   bool soundOn;
  UserModel({
    required this.name,
    required this.imageUrl,
    required this.isDarkMode,
    required this.soundOn,
  });

}