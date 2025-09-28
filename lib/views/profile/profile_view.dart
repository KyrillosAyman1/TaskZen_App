import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:taskzen_app/cubit/user_cubit/user_cubit.dart';
import 'package:taskzen_app/helper/custom_show_snak_bar.dart';
import 'package:taskzen_app/models/user_model.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';
import 'package:taskzen_app/views/home/task_view.dart';
import 'package:taskzen_app/widgets/custom_elevated_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? _image;
  bool isDarkMode = false;
  bool soundOn = false;

  @override
  void initState() {
    super.initState();
    final userCubit = BlocProvider.of<UserCubit>(context);
    if (userCubit.state is UserSuccess &&
        (userCubit.state as UserSuccess).users.isNotEmpty) {
      final user = (userCubit.state as UserSuccess).users.first;

      nameController.text = user.name;
      _image = user.imageUrl;
      isDarkMode = user.isDarkMode;
      soundOn = user.soundOn;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: kPrimaryColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Profile', style: TextStyle(color: kPrimaryColor)),
        actions: [
          IconButton(
            onPressed: () {
              isDarkMode = !isDarkMode;
              BlocProvider.of<ThemeCubit>(context).changeTheme(isDarkMode);
            },
            icon: Icon(Icons.light_mode, color: kPrimaryColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  _image == null || _image == ""
                      ? CircleAvatar(
                          radius: 70,
                          backgroundColor: kPrimaryColor,
                          child: Icon(Icons.person, size: 70),
                        )
                      : CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(File(_image!)),
                        ),

                  Positioned(
                    bottom: -10,
                    right: 130,

                    child: IconButton.filled(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? image = await imagePicker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) {
                          setState(() {
                            _image = image.path;
                          });
                        }
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    UserModel userModel = UserModel(
                      isDarkMode: false,
                      soundOn: false,
                      name: nameController.text,
                      imageUrl: "",
                    );
                    BlocProvider.of<UserCubit>(context).updateUser(userModel);
                    setState(() {
                      _image = "";
                    });

                    customShowSnackBar(
                      context: context,
                      message: "Profile updated successfully",
                    );
                  },
                  child: Text(
                    "Delete Photo",
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(
                hint: "Enter your name",
                controller: nameController,
              ),
              SizedBox(height: 20),

              CustomElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    UserModel userModel = UserModel(
                      isDarkMode: isDarkMode,
                      soundOn: false,
                      name: nameController.text,
                      imageUrl: _image ?? "",
                    );
                    BlocProvider.of<UserCubit>(context).addUser(userModel);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TaskView()),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                buttonText: "Done",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
