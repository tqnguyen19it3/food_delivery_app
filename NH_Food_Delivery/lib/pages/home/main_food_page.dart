import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/widgets/small_text.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../widgets/big_text.dart';
import 'body_food_page.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {

  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "VIET NAM", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "Da Nang", color: Colors.black54,),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search, color: Colors.white),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(
          child: BodyFoodPage(),
        )),
      ],
    ),
        onRefresh: _loadResource
    );
  }
}
