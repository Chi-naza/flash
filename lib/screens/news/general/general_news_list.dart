import 'package:flash/widgets/news_list_widget.dart';
import 'package:flash/widgets/our_button.dart';
import 'package:flutter/material.dart';
import '../../../utilities/data2.dart';

class GeneralNewsListScreen extends StatelessWidget {
  const GeneralNewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: NewsListWidget(
        titleText: 'General News',
        headerImage: 'assets/images/economy.jpg',
        sliverDelegate: SliverChildBuilderDelegate(
          ((context, index) {
            return Column(
              children: [
                Material(
                  elevation: 4,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h*0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Image: first item in the outer Row
                          Container(
                            margin: EdgeInsets.only(left: h * 0.01),
                            height: h * 0.14,
                            width: h * 0.12,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(screenData[index]['image']),
                                ),
                                borderRadius: BorderRadius.circular(h * 0.02)),
                          ),
                          // Second Item in our Row. Beside the Image
                          Container(
                            margin: EdgeInsets.only(left: h * 0.01),                                                  
                            width: w - h*0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(                                    
                                  screenData[index]['text'] + screenData[index]['text2'] + screenData[index]['text3'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    // color: Colors.bl,
                                  ),
                                ),                             
                                SizedBox(height: h * 0.01),
                                Container(
                                  margin: EdgeInsets.only(left: h * 0.001),
                                  child: Row(
                                    children: [
                                      OurButton(
                                        text: 'GENERAL', 
                                        height: h*0.047, 
                                        width: w-280, 
                                        radius: h*0.009, 
                                        fontSize: h*0.016,
                                      ),
                                      SizedBox(
                                        width: h * 0.006,
                                      ),
                                      Text(
                                        '08 February',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Giving space between the list items
                SizedBox(height: h*0.02),
              ],
            );
          }),
          childCount: 5,
        ),
      ),
    );
  }
}