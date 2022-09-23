import 'package:flash/utilities/my_app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                return  Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/CAMILLUS.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'Sports',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyAppColors.appWhite,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                return  Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/CAMILLUS.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'Arts',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyAppColors.appWhite,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                return  Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/CAMILLUS.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'Music',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyAppColors.appWhite,
                    ),
                  ),
                );
              }),
            ),
            // GRID
            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 3,
            //   crossAxisSpacing: 5,
            //   mainAxisSpacing: 5,
            //   childAspectRatio: 1,
            //   children: List.generate(10, (index) {
            //     return ColoredBox(
            //       child: Text('A'),
            //       color: MyAppColors.mainColorLight,
            //     );
            //   }),
            // ),
            SizedBox(height: 30,),
          ],
        ),
      )
    );
  }
}