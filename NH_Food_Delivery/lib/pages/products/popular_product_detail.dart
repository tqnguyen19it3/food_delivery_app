import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nh_food_delivery/controllers/cart_controller.dart';
import 'package:nh_food_delivery/controllers/popular_product_controller.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';
import 'package:nh_food_delivery/widgets/app_column.dart';
import 'package:nh_food_delivery/widgets/app_icon.dart';
import 'package:nh_food_delivery/widgets/expandable_text.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class PopularProductDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularProductDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // backround image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL +  AppConstants.UPLOAD_URL + product.img!
                      )
                  )
                ),
          )),
          // icon widget
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(page=='cartpage'){
                        Get.toNamed(RouteHelper.getCartPage());
                      }else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)
                  ),

                  GetBuilder<PopularProductController>(builder: (controller){
                    return GestureDetector(
                      onTap: (){
                        // if(controller.totalItems >= 1)
                          Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1 ? Positioned(right:0, top:0,
                          child: AppIcon(icon: Icons.circle, size:20, iconColor: Colors.transparent, backgroundColor: AppColors.mainColor,)
                          ) : Container(),
                          Get.find<PopularProductController>().totalItems >= 1 ? Positioned(right:5, top:5, child: BigText(text: Get.find<PopularProductController>().totalItems.toString(), size: 12, color: Colors.white,)) : Container()
                        ],
                      )
                    );
                  })
                ],
              )
          ),
          // itroduction
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name),
                    SizedBox(height: 20,),
                    BigText(text: "Introduce"),
                    SizedBox(height: 20,),
                    Expanded(child: SingleChildScrollView(
                      child: ExpandableText(text: product.description!)
                    ))
                  ],
                ),
              )
          ),
          // expandable text widget

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20*2),
                  topRight: Radius.circular(20*2)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove, color: AppColors.signColor,),
                    ),
                    SizedBox(width: 10/2),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: 10/2),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor,),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                  child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mainColor
                  ),
                ),
              )
            ],
          ),
        );
      },)
    );
  }

}
