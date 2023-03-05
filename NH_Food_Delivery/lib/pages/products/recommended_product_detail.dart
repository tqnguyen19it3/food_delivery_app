import 'package:flutter/material.dart';
import 'package:nh_food_delivery/controllers/popular_product_controller.dart';
import 'package:nh_food_delivery/controllers/recommended_product_controller.dart';
import 'package:nh_food_delivery/routes/route_helper.dart';
import 'package:nh_food_delivery/utils/app_constants.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/widgets/app_icon.dart';
import 'package:nh_food_delivery/widgets/big_text.dart';
import 'package:nh_food_delivery/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/dimensions.dart';

class RecommendedProductDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedProductDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
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
                    child: AppIcon(icon: Icons.clear)
                ),
                // AppIcon(icon: Icons.shopping_cart_outlined)
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                      onTap: (){
                        // if(controller.totalItems >= 1)
                          Get.toNamed(RouteHelper.getCartPage());
                        },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1 ?
                        Positioned(
                        right:0, top:0,
                        child: AppIcon(icon: Icons.circle, size:20, iconColor: Colors.transparent, backgroundColor: AppColors.mainColor,)
                        ) : Container(),
                        Get.find<PopularProductController>().totalItems >= 1 ? Positioned(right:5, top:5, child: BigText(text: Get.find<PopularProductController>().totalItems.toString(), size: 12, color: Colors.white,)) : Container()
                      ],
                    )
                  );
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size: 26, text: product.name!)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +  AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableText(
                    text: product.description!
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 20*2.5,
                  right: 20*2.5,
                  top: 10,
                  bottom: 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },
                    child:  AppIcon(iconSize: 24, iconColor: Colors.white, backgroundColor: AppColors.mainColor, icon: Icons.remove),
                  ),
                  BigText(text: "\$ ${product.price!} X  ${controller.inCartItems}", color: AppColors.mainBlackColor, size: 26),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child:  AppIcon(iconSize: 24, iconColor: Colors.white, backgroundColor: AppColors.mainColor, icon: Icons.add),
                  )
                ],
              ),
            ),
            Container(
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
                      padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                      child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
