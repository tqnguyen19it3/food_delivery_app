import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: 26,),
        SizedBox(height: Dimensions.height10, ),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) { return Icon(Icons.star, color: AppColors.mainColor, size: 15);}),
            ),
            SizedBox(width: Dimensions.width15,),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width15,),
            SmallText(text: "1000"),
            SizedBox(width: Dimensions.width15,),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1
            ),
            IconAndText(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor
            ),
            IconAndText(
                icon: Icons.access_time_rounded,
                text: "32 min",
                iconColor: AppColors.iconColor2
            )
          ],
        )
      ],
    );
  }
}
