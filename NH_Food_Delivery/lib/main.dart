import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nh_food_delivery/controllers/cart_controller.dart';
import 'package:nh_food_delivery/controllers/popular_product_controller.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dependencies;
import 'routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Delivery',

          // home: SignInPage(),
          // home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
          theme: ThemeData(
            primaryColor: AppColors.mainColor,
            fontFamily: 'Lato',
          )
        );
      });
    },);
  }
}
