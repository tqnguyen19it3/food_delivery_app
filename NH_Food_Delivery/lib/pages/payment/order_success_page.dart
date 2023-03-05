import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nh_food_delivery/base/custom_button.dart';
import 'package:nh_food_delivery/routes/route_helper.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';

class OrderSuccessPage extends StatelessWidget {
  
  final String orderID;
  final int status;
  OrderSuccessPage({required this.orderID, required this.status});
  
  @override
  Widget build(BuildContext context) {
    if(status == 0){
      Future.delayed(Duration(seconds: 1), (){

      });
    }
    return Scaffold(
      body: Center(child: SizedBox(width: Dimensions.screenWidth, child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(status == 1 ? Icons.check_circle_outline : Icons.warning_amber_outlined,
            size: 100, color: AppColors.mainColor,
          ),
        // Image.asset(status == 1 ? "assets/image/checked.png" : "assets/image/warning.png", width: 100, height: 100,),
        SizedBox(height: Dimensions.height45,),
        Text(
          status == 1 ? 'You placed the order successfully' : 'Your order failed',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        SizedBox(height: Dimensions.height20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20, vertical: Dimensions.height20),
          child: Text(
            status == 1 ? 'Successful order' : 'Failed order',
            style:  TextStyle(fontSize: Dimensions.font20, color: Theme.of(context).disabledColor),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: Dimensions.height30,),
        Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: CustomButton(buttonText: 'Back to HomePage', onPressed: () => Get.offAllNamed(RouteHelper.getInitial())),
        )
      ],
      ),)),
    );
  }
}
