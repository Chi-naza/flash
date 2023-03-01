import 'package:flash/controllers/news_controller.dart';
import 'package:flash/screens/news/art/art_news_detail.dart';
import 'package:flash/widgets/news_list_widget.dart';
import 'package:flash/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtNewsListScreen extends StatelessWidget {
  
  ArtNewsListScreen({Key? key}) : super(key: key);

  NewsController newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
          return newsController.stillFetching.value? const Center(child: CircularProgressIndicator()) : NewsListWidget(
            appBarTitleText: 'Art News',
            titleText: newsController.artNewsList[0].title!,//"The world's higest paid footballers and managers in 2020 have been named-GIVEMESPORT",
            headerImage: newsController.artNewsList[0].urlToImage!,//'assets/images/economy.jpg',
            sliverDelegate: SliverChildBuilderDelegate(
              ((context, index) {

                var artNews = newsController.artNewsList[index];

                return Column(
                  children: [
                    Material(
                      elevation: 4,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: h*0.01),
                          child: InkWell(
                            onTap: () {
                              Get.to(ArtNewsDetailScreen(newsArticle: artNews));
                            },
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Image: first item in the outer Row
                                artNews.urlToImage! == null? CircularProgressIndicator() : Container(
                                  margin: EdgeInsets.only(left: h * 0.01),
                                  height: h * 0.14,
                                  width: h * 0.12,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(artNews.urlToImage!),//AssetImage(screenData[index]['image']),
                                      ),
                                      borderRadius: BorderRadius.circular(h * 0.02)),
                                ),
                                // Second Item in our Row. Beside the Image
                                Container(
                                  margin: EdgeInsets.only(left: h * 0.01),                                                  
                                  width: w*0.7,
                                  // color: Colors.amber,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(                                    
                                        artNews.description!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),                             
                                      SizedBox(height: h * 0.01),
                                      Container(
                                        margin: EdgeInsets.only(left: h * 0.001),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: OurButton(
                                                text: 'ART', 
                                                height: h*0.047, 
                                                width: w*0.3, 
                                                radius: h*0.009, 
                                                fontSize: h*0.016,
                                              ),
                                            ),
                                            SizedBox(
                                              width: h * 0.006,
                                            ),
                                            Expanded(
                                              child: Text(
                                                artNews.publishedAt!,//'08 February',
                                                style: TextStyle(color: Colors.grey),
                                              ),
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
                    ),
                    // Giving space between the list items
                    SizedBox(height: h*0.02),
                  ],
                );
              }),
              childCount: newsController.artNewsList.length,
            ),
          );
        }
      ),
    );
  }
}