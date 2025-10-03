import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/cubit/user_cubit/user_cubit.dart';
import 'package:taskzen_app/views/profile/profile_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        String userName = "Guest"; // اسم افتراضي لو مفيش بيانات
         String image = "";
        if (state is UserSuccess && state.users.isNotEmpty) {
          userName = state.users.first.name;
          image = state.users.first.imageUrl;
        }

        return ListTile(
          title: Text(
            "Hello, $userName",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          subtitle: Text(
            "Have a nice day!",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing:
             image == "" ?
           CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child:
              
             IconButton(
              icon: const Icon(Icons.person, color: kPrimaryColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileView(isStart: false,),
                  ),
                );
              },
            ),
          ):  GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileView(isStart: false,),
                  ),
                );
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: CircleAvatar(
                
                radius: 22,
                 
                backgroundImage: FileImage(File(image)),
              ),
            ),
          )
          
          );
      },
    );
  }
}


