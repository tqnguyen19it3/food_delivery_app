import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nh_food_delivery/base/custom_loader.dart';
import 'package:nh_food_delivery/base/show_custom_snackbar.dart';
import 'package:nh_food_delivery/models/signup_body_model.dart';
import 'package:nh_food_delivery/routes/route_helper.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';
import 'package:nh_food_delivery/widgets/app_text_field.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png", "f.png", "g.png"
    ];

    void _registration(AuthController authController){

      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      //validate
      if(name.isEmpty){
        showCustomSnackBar("Type in your name", title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone", title: "Phone number");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email address", title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "Password");
      }else if(password.length < 6){
        showCustomSnackBar("Password can not be less than six characters", title: "Password length");
      }else{
        // showCustomSnackBar("All went well", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
            name: name,
            phone: phone,
            email: email,
            password: password
        );
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("SUCCESS REGISTRATION");
            Get.offNamed(RouteHelper.getInitial());
          }else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading ? SingleChildScrollView(
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
              AppTextField(textController: emailController, hintText: "Email", icon: Icons.email),
              SizedBox(height: Dimensions.height20,),
              AppTextField(textController: passwordController, hintText: "Password", icon: Icons.password_sharp, isObscure: true,),
              SizedBox(height: Dimensions.height20,),
              AppTextField(textController: nameController, hintText: "Name", icon: Icons.person),
              SizedBox(height: Dimensions.height20,),
              AppTextField(textController: phoneController, hintText: "Phone", icon: Icons.phone),
              SizedBox(height: Dimensions.height20 + Dimensions.height20,),

              GestureDetector(
                onTap: (){
                  _registration(_authController);
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
                          text: "Sign up",
                          size: 30,
                          color: Colors.white
                      ),
                    )
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  )
              )),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              RichText(text: TextSpan(
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  )
              )),
              Wrap(
                  children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            "assets/image/" + signUpImages[index]
                        ),
                      )),
                  )
              )

            ],
          ),
        ) : const CustomLoader();
      })
    );
  }
}
