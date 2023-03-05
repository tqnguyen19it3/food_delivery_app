import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nh_food_delivery/base/custom_loader.dart';
import 'package:nh_food_delivery/pages/account/account_page.dart';
import 'package:nh_food_delivery/pages/auth/sign_up_page.dart';
import 'package:nh_food_delivery/routes/route_helper.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';
import 'package:nh_food_delivery/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var emailController = TextEditingController();
    var nameController = TextEditingController();

    void _login(AuthController authController){

      // String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      //validate
      if(phone.isEmpty){
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      // }
      // else if(!GetUtils.isEmail(email)){
      //   showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "Password");
      }else if(password.length < 6){
        showCustomSnackBar("Password can not be less than six characters", title: "Password length");
      }else{
        authController.login(phone, password).then((status){
          if(status.isSuccess){
            print("SUCCESS LOGIN");
            //Get.to(AccountPage());
            Get.toNamed(RouteHelper.getInitial());
            Get.find<UserController>().getUserInfo();
            // Get.toNamed(RouteHelper.getCartPage());
          }else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController){
          return !authController.isLoading? SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: Dimensions.screenHeight*0.05,),
                Container(
                    height: Dimensions.screenHeight*0.25,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        backgroundImage: AssetImage(
                            "assets/image/logo part 1.png"
                        ),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 20*3+20/2,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Sign into your account",
                        style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold
                            color: Colors.grey[500]
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height20,),

                AppTextField(textController: phoneController, hintText: "Phone number", icon: Icons.phone),
                SizedBox(height: Dimensions.height20,),
                AppTextField(textController: passwordController, hintText: "Password", icon: Icons.password_sharp, isObscure: true),
                SizedBox(height: Dimensions.height20),
                Row(
                  children: [
                    Expanded(child: Container()),
                    RichText(text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 20,
                        )
                    )),
                    SizedBox(width: Dimensions.width20,),
                  ],
                ),
                SizedBox(height: Dimensions.screenHeight*0.05,),

                GestureDetector(
                  onTap: (){
                    _login(authController);

                  },
                  child: Container(
                      width: Dimensions.screenWidth/2,
                      height: Dimensions.screenHeight/13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.mainColor
                      ),
                      child: Center(
                        child: BigText(
                            text: "Sign in",
                            size: 30,
                            color: Colors.white
                        ),
                      )
                  ),
                ),

                SizedBox(height: Dimensions.screenHeight*0.05,),
                RichText(text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fadeIn),
                          text: " Create",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainBlackColor,
                            fontSize: 20,
                          ))
                    ]
                )),
              ],
            ),
          ) : CustomLoader();
        })
    );
  }
}
