import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart' show Hive;
import 'package:meta/meta.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

   addUser(UserModel user) async {
    try {
  var userBox = Hive.box<UserModel>(kUserBox);
  await  userBox.add(user);
   emit(UserSuccess());
}  catch (e) {
    emit(UserFailure(e.toString()));
}
   }
}
