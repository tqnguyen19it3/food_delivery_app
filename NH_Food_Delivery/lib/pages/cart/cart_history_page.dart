import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nh_food_delivery/base/custom_app_bar.dart';
import 'package:nh_food_delivery/base/no_data_page.dart';
import 'package:nh_food_delivery/models/cart_model.dart';
import 'package:nh_food_delivery/routes/route_helper.dart';
import 'package:nh_food_delivery/utils/app_constants.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';
import 'package:nh_food_delivery/widgets/app_icon.dart';
import 'package:nh_food_delivery/widgets/big_text.dart';
import 'package:nh_food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/cart_controller.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();

    for(int i=0; i<getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      }else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;
    Widget timeWidget(int index){
      var outputDate = DateTime.now().toString();
      if(index < getCartHistoryList.length){
        DateTime parseDate = DateFormat("yyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
      appBar: CustomAppBar(title: "Cart History",),
      body: Column(
        children: [
          // Container(
          //   height: 100,
          //   color: AppColors.mainColor,
          //   width: double.maxFinite,
          //   padding: EdgeInsets.only(top: 45),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       BigText(text: "Your Cart History", color: Colors.white,),
          //       AppIcon(icon: Icons.shopping_cart_outlined, iconColor: AppColors.mainColor,)
          //     ],
          //   ),
          // ),
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getCartHistoryList().length > 0 ? Expanded(child: Container(
              margin: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20
              ),
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      for(int i = 0; i < itemsPerOrder.length; i++)
                        Container(
                          height: 120,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              timeWidget(listCounter),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(itemsPerOrder[i], (index){
                                      if(listCounter<getCartHistoryList.length){
                                        listCounter++;
                                      }
                                      return index <= 2 ? Container(
                                        height: 80,
                                        width: 80,
                                        margin: EdgeInsets.only(right: 10/2),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15/2),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    AppConstants.BASE_URL + AppConstants.UPLOAD_URL + getCartHistoryList[listCounter-1].img!
                                                )
                                            )
                                        ),
                                      ) : Container();
                                    }),
                                  ),
                                  Container(
                                    height: 80,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SmallText(text: "Total", color: AppColors.titleColor),
                                        BigText(text: itemsPerOrder[i].toString() + " items", color: AppColors.titleColor),
                                        GestureDetector(
                                          onTap: (){
                                            var orderTime = cartOrderTimeToList();
                                            Map<int, CartModel> moreOrder = {};
                                            for(int j=0; j<getCartHistoryList.length; j++){
                                              if(getCartHistoryList[j].time == orderTime[i]){
                                                // print(orderTime[i]);
                                                moreOrder.putIfAbsent(getCartHistoryList[j].id!, () => CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))));
                                              }
                                            }
                                            Get.find<CartController>().setItems = moreOrder;
                                            Get.find<CartController>().addToCartList();
                                            Get.toNamed(RouteHelper.getCartPage());
                                          },
                                          child:  Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10/2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15/3),
                                              border: Border.all(width: 1, color: AppColors.mainColor),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset("assets/image/repurchase.png",height: 15, width: 15, color: Theme.of(context).primaryColor,),
                                                SizedBox(width: Dimensions.width10/2,),
                                                Text(
                                                  "Repurchase",
                                                  style: TextStyle(color: Theme.of(context).primaryColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  )
              ),
            )) : SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              child: const Center(
                child: NoDataPage(
                  text: "You didn't buy anithing so far!",
                  imgPath: "assets/image/empty_box.png",
                )
              )
            );
          })
        ],
      )
    );
  }
}
