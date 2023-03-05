import 'package:get/get.dart';

class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView= screenHeight/2.64;
  static double pageViewContainer= screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;

  //list view size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextContSize = screenWidth/3.9;

  //popular details
  static double popularFoodImgSize = screenHeight/2.41;

  //bottom height
  static double bottomHeightBar = screenHeight/7.03;

  //splash screen
  static double splashImg = screenHeight/3.38;

  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27;
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;

  static double width10 = screenWidth/84.4;
  static double width15 = screenWidth/56.27;
  static double width20 = screenWidth/42.2;
  static double width30 = screenWidth/28.13;

  static double font20 = screenHeight/42.2;

  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

}