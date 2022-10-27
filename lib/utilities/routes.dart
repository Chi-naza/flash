import 'package:flash/screens/auth/signin_screen.dart';
import 'package:flash/screens/auth/signup_screen.dart';
import 'package:flash/screens/home/home_screen.dart';
import 'package:get/get.dart';

class Routes {

  // List of our pages
  static List<GetPage> flashRoutes = [
    // homes screen
    GetPage(
      name: HomeScreen.routeName, 
      page: () => const HomeScreen(),
    ),

    // signIn screen
    GetPage(
      name: SignInScreen.routeName, 
      page: () => SignInScreen(),
    ),

    // SignUp screen
    GetPage(
      name: SignUpScreen.routeName, 
      page: () => const SignUpScreen(),
    ),

  ];



}