import 'package:flutter/material.dart';

class GeneralNewsDetailScreen extends StatelessWidget {
  const GeneralNewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w.toDouble(),
              height: h*0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/sport.jpg'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: h*0.01),
              child: Text(
                "The world's higest paid footballers and managers in 2020 have been named-GIVEMESPORT",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: h*0.012),
            Container(
              padding: EdgeInsets.symmetric(horizontal: h*0.01),
              alignment: Alignment.centerLeft,
              child: Text(
                'Rob Swan   08 February 2020 10:4',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: h*0.012),
            Divider(
              thickness: h*0.0005,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: h*0.01),
              child: Text(
                "French publication L'Equipe have published their annual list of the current higest paid players and vcoaches in world football.\nLioonel Messi and Cristiano Ronaldo are top of the player's list,which wont come as a huge shock.\nHowever,it may suprise football fans",
                style: TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
