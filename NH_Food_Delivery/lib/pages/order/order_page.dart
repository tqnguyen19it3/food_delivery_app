import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nh_food_delivery/base/custom_app_bar.dart';
import 'package:nh_food_delivery/base/custom_loader.dart';
import 'package:nh_food_delivery/base/no_data_page.dart';
import 'package:nh_food_delivery/controllers/auth_controller.dart';
import 'package:nh_food_delivery/controllers/order_controller.dart';
import 'package:nh_food_delivery/controllers/user_controller.dart';
import 'package:nh_food_delivery/pages/order/view_order.dart';
import 'package:nh_food_delivery/routes/route_helper.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';
import 'package:nh_food_delivery/widgets/big_text.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin{

  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState(){
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_isLoggedIn){
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "My orders",),
      body:GetBuilder<UserController>(builder: (userController){
         return _isLoggedIn ? (userController.isLoading ? Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Theme.of(context).disabledColor,
              controller: _tabController,
              tabs: const [
                Tab(text: "Current",),
                Tab(text: "History"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ViewOrder(isCurrent: true),
                ViewOrder(isCurrent: false),
              ],
            ),
          )
        ],
      ): CustomLoader())
             : SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              child: const Center(
                child: NoDataPage(
                  text: "You can't track your order because you aren't logged in!",
                  imgPath: "assets/image/onboard_2.png",
                )
              )
          );
      }),
    );
  }
}