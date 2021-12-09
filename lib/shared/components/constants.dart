import 'dart:io';

import 'package:flutter_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_app/modules/social_app/social_login/social_login_screen.dart';
import 'package:flutter_app/shared/components/componets.dart';
import 'package:flutter_app/shared/network/local/cache_helper.dart';

String ?token = '';
String ?uId = '';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(
        context,
        ShopLoginScreen(),
      );
    }
  });
}

void socialSignOut(context) {

  CacheHelper.removeData(key:'uId').then((value){
    uId = CacheHelper.getData(key: 'uId');
    if(value){
      navigateAndFinish(
        context,
        SocialLoginScreen(),
      );
    }
  });
}
void logOutSocial(context) {
  CacheHelper.sharedPreferences.clear();
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      navigateAndFinish(
        context,
        SocialLoginScreen(),
      );
    }
  });
}

String getOS(){
  return Platform.operatingSystem;
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
