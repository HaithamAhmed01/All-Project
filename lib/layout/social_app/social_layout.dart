import 'package:flutter/material.dart';
import 'package:flutter_app/layout/social_app/cubit/cubit.dart';
import 'package:flutter_app/layout/social_app/cubit/states.dart';
import 'package:flutter_app/modules/social_app/new_post/new_post_screen.dart';
import 'package:flutter_app/modules/social_app/social_login/social_login_screen.dart';
import 'package:flutter_app/shared/components/componets.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_app/shared/network/local/cache_helper.dart';
import 'package:flutter_app/shared/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // if (state is SocialLogOutErrorState) {
        //   showToast(
        //     text: state.error,
        //     state: ToastStates.ERROR,
        //   );
        // }
        // if(state is SocialLogOutSuccessState)
        // {
        //   CacheHelper.removeData(
        //     key: 'uId',
        //   ).then((value)
        //   {
        //     navigateAndFinish(
        //       context,
        //       SocialLoginScreen(),
        //     );
        //   });
        // }
        if (state is SocialNewPostState) {
          navigateTo(
            context,
            NewPostScreen(),
          );
        }
        // if (state is SocialLogOutSuccessState){
        //   CacheHelper.removeData(key: 'uId',);
        // }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                icon: Icon(IconBroken.Notification),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(IconBroken.Search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(IconBroken.Logout),
                onPressed: () {
                  socialSignOut(context);
                  cubit.currentIndex=0;
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Paper_Upload,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.User1,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
