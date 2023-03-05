
import 'package:get/get.dart';
import 'package:nh_food_delivery/controllers/auth_controller.dart';
import 'package:nh_food_delivery/controllers/cart_controller.dart';
import 'package:nh_food_delivery/controllers/location_controller.dart';
import 'package:nh_food_delivery/controllers/order_controller.dart';
import 'package:nh_food_delivery/controllers/popular_product_controller.dart';
import 'package:nh_food_delivery/controllers/user_controller.dart';
import 'package:nh_food_delivery/data/repository/auth_repo.dart';
import 'package:nh_food_delivery/data/repository/cart_repo.dart';
import 'package:nh_food_delivery/data/repository/location_repo.dart';
import 'package:nh_food_delivery/data/repository/order_repo.dart';
import 'package:nh_food_delivery/data/repository/popular_product_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/recommended_product_repo.dart';
import '../data/repository/user_repo.dart';
import '../utils/app_constants.dart';

Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences:Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences:Get.find()));

  Get.lazyPut(() => OrderRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()),);
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
}
  