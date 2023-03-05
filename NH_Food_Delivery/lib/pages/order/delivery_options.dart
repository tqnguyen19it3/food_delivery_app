import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nh_food_delivery/controllers/order_controller.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const DeliveryOptions({super.key, required this.value, required this.title, required this.amount, required this.isFree});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      return Row(
        children: [
          Radio(
            onChanged: (String ? value) => orderController.setDeliveryType(value!),
            groupValue: orderController.orderType,
            value: value,
            activeColor: Theme.of(context).primaryColor,
          ),
          SizedBox(width: Dimensions.width10/2,),
          Text(title,),
          SizedBox(width: Dimensions.width10/2,),
          Text(
            '(${(value == 'take away' || isFree) ? 'Free' : '\$${amount/10}'})',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      );
    });
  }
}