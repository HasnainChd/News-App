import 'package:get/get.dart';
import 'package:newsapp/Pages/BottomPages/article_page.dart';
import 'package:newsapp/Pages/BottomPages/profile_page.dart';
import 'package:newsapp/Pages/home_page.dart';

class BottomNavBarController extends GetxController{
   RxInt selectedIndex =0.obs;

   var pages=[
      const HomePage(),
      const ArticlePage(),
      const ProfilePage(),
   ];
}