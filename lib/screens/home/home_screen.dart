import 'package:flash/controllers/auth_controller.dart';
import 'package:flash/screens/auth/profile_screen.dart';
import 'package:flash/screens/news/art/art_news_list.dart';
import 'package:flash/screens/news/economy/economy_news_list.dart';
import 'package:flash/screens/news/fun/fun_news_list.dart';
import 'package:flash/screens/news/general/general_news_list.dart';
import 'package:flash/screens/news/health/health_news_list.dart';
import 'package:flash/utilities/data.dart';
import 'package:flash/utilities/my_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';

  Authcontroller authcontroller = Get.find<Authcontroller>();


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();

    print("OUR SCREEN: ($w , $h)");

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: const Text(
          "News Category",
          style: TextStyle(
            color: MyAppColors.mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: (){
              Get.to(ProfileScreen());
            }, 
            icon: const Icon(
              Icons.person,
              color: MyAppColors.mainGreyColor,
            ),
          ),
          IconButton(
            onPressed: (){
              authcontroller.logoutUser();
            }, 
            icon: const Icon(
              Icons.logout,
              color: MyAppColors.mainGreyColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: h*0.008, vertical: h*0.08),
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: h*0.006,
            mainAxisSpacing: h*0.0075,
            childAspectRatio: h/h*0.6,
            children: List.generate(homeData.length, (index) {
              return  InkWell(
                onTap: () {
                  if(index == 0){
                    // add screen
                  }else if(index == 1){
                    // economy
                    Get.to(EconomyNewsListScreen());
                  }else if(index == 2){
                    //add screen
                  }else if(index == 3){
                    //health
                    Get.to(HealthNewsListScreen());
                  }else if(index == 4){
                    //fun
                    Get.to(FunNewsListScreen());
                  }else if(index == 5){
                    //add screen
                  }else if(index == 6){
                    Get.to(GeneralNewsListScreen());
                  }else if(index == 7){
                    //add screen
                  }else if(index == 8){
                    //art
                    Get.to(ArtNewsListScreen());
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.35),
                        BlendMode.darken
                      ),
                      image: AssetImage(homeData[index]['photo']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    homeData[index]['title'],
                    style: TextStyle(
                      fontSize: h*0.035,
                      fontWeight: FontWeight.bold,
                      color: MyAppColors.appWhite,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}


