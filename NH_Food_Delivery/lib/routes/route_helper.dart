
import 'package:get/get.dart';
import 'package:nh_food_delivery/models/order_model.dart';
import 'package:nh_food_delivery/pages/address/add_address_page.dart';
import 'package:nh_food_delivery/pages/address/pick_address_map.dart';
import 'package:nh_food_delivery/pages/auth/sign_in_page.dart';
import 'package:nh_food_delivery/pages/cart/cart_page.dart';
import 'package:nh_food_delivery/pages/payment/order_success_page.dart';
import 'package:nh_food_delivery/pages/payment/payment_page.dart';
import 'package:nh_food_delivery/pages/products/popular_product_detail.dart';
import 'package:nh_food_delivery/pages/splash/splash_page.dart';

import '../pages/home/home_page.dart';
import '../pages/products/recommended_product_detail.dart';

class RouteHelper{

  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularProduct = "/popular-product";
  static const String recommendedProduct = "/recommended-product";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String addAddress = "/add-address";
  static const String pickAddressMap = "/pick-address";
  static const String payment = "/payment";
  static const String orderSuccess = "/order-successful";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularProduct(int pageId, String page) => '$popularProduct?pageId=$pageId&page=$page';
  static String getRecommendedProduct(int pageId, String page) => '$recommendedProduct?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';
  static String getAddressPage() => '$addAddress';
  static String getPickAddressPage() => '$pickAddressMap';
  static String getPaymentPage(String id, int userId) => '$payment?id=$id&userID=$userId';
  static String getOrderSuccessPage(String orderID, String status) => '$orderSuccess?id=$orderID&status=$status';

  static List<GetPage> routes = [

    GetPage(name: pickAddressMap, page: (){
      PickAddressMap _pickAddress = Get.arguments;
      return _pickAddress;
    }),

    GetPage(name: splashPage, page: () => SplashScreen()),

    GetPage(name: initial, page: () {
      return HomePage();
    }, transition: Transition.fade),

    GetPage(name: signIn, page: (){
      return SignInPage();
    }, transition: Transition.fade),

    GetPage(name: popularProduct, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularProductDetails(pageId: int.parse(pageId!), page:page!);
    },
        transition: Transition.fadeIn
    ),

    GetPage(name: recommendedProduct, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedProductDetails(pageId: int.parse(pageId!), page:page!);
    },
        transition: Transition.fadeIn
    ),

    GetPage(name: cartPage, page: (){
      return CartPage();
    },
        transition: Transition.fadeIn
    ),

    GetPage(name: addAddress, page: (){
      return AddAddressPage();
    },
        transition: Transition.fadeIn
    ),
    GetPage(name: payment, page: () => PaymentPage(
        orderModel: OrderModel(
          id: int.parse(Get.parameters['id']!),
          userId: int.parse(Get.parameters['userID']!)
        )
    )),
    GetPage(name: orderSuccess, page: () => OrderSuccessPage(
      orderID: Get.parameters['id']!,
      status: Get.parameters['status'].toString().contains("success")?1:0,
    )),
  ];

}