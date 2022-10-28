import 'package:flash/controllers/auth_controller.dart';
import 'package:flash/screens/auth/signin_screen.dart';
import 'package:flash/utilities/my_app_colors.dart';
import 'package:flash/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({Key? key}) : super(key: key);

  static String routeName = '/sign-up';

  Authcontroller authController = Get.find<Authcontroller>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.05,
                  child: ShaderMask(
                      child: Image(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                      ),
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(colors: [
                          Colors.black,
                          MyAppColors.mainColorLight,
                        ]).createShader(bounds);
                      }),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  ShaderMask(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: w * 0.29,
                      ),
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(colors: [
                          MyAppColors.mainColor,
                          MyAppColors.mainColorLight,
                        ]).createShader(bounds);
                      }),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        autocorrect: true,
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h*0.023),
                          prefixIcon: Icon(
                            Icons.email,
                            color: MyAppColors.mainColor,
                          ),
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        autocorrect: true,
                        controller: usernameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h*0.023),
                          prefixIcon: Icon(
                            Icons.person,
                            color: MyAppColors.mainColor,
                          ),
                          hintText: 'Username',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        autocorrect: true,
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h*0.023),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: MyAppColors.mainColor,
                          ),
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        autocorrect: true,
                        controller: confirmPasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h*0.023),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: MyAppColors.mainColor,
                          ),
                          hintText: 'Confirm Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.06,
                  ),
                  //Sign Up Button
                GestureDetector(
                  onTap: (){
                    var email = emailController.text.trim();
                    var pswd = passwordController.text.trim();
                    var pswd2 = confirmPasswordController.text.trim();
                    var username = usernameController.text.trim();

                    print("User email = ${email}");
                    print("User password = ${pswd}");
                    authController.validateSignUp(email, pswd, pswd2, username);
                  },
                  child: OurButton(
                    text: 'SignUp', 
                    height: h * 0.08, 
                    width: w - 100, 
                    radius: h*0.05, 
                    fontSize: h*0.03,
                  ),
                ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(fontSize: h*0.02),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(SignInScreen.routeName),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: MyAppColors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: h*0.02),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: h*0.03),
                ],                
              ),
            ),
          ],
        ),
      ),
    );
  }
}