import 'package:flash/utilities/data.dart';
import 'package:flash/utilities/my_app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    print("OUR SCREEN: ($w , $h)");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Category",
          style: TextStyle(
            color: MyAppColors.mainColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.search,
              color: MyAppColors.mainGreyColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: h*0.01, vertical: h*0.06),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 5,
          childAspectRatio: h/h*0.6,
          children: List.generate(homeData.length, (index) {
            return  Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
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
            );
          }),
        ),
      ),
    );
  }
}


