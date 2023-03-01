import 'package:flash/models/news_model.dart';
import 'package:flash/utilities/APIs.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {

  // NEWS LISTS
  final generalNewsList = <Articles>[].obs;
  final artNewsList = <Articles>[].obs;
  final economyNewsList = <Articles>[].obs;
  final funNewsList = <Articles>[].obs;
  final healthNewsList = <Articles>[].obs;
  final musicNewsList = <Articles>[].obs;
  final scienceNewsList = <Articles>[].obs;
  final sportsNewsList = <Articles>[].obs;
  final techNewsList = <Articles>[].obs;

  // A reactive boolean variable to check if data is still being loaded
  final stillFetching = false.obs;



  // GetConnect from getX
  final _getConnect = GetConnect();

  @override
  void onReady() {
    fetchAllNewsData();
    super.onReady();
  }



  Future<void> fetchAllNewsData() async {
    await fetchGeneralNewsData();
    await fetchEconomyNewsData();
    await fetchFunNewsData();
    await fetchHealthNewsData();
    await fetchMusicNewsData();
    await fetchScienceNewsData();
    await fetchSportsNewsData();
    await fetchTechNewsData();
    await fetchArtNewsData();
  }


  Future<void> fetchGeneralNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(generalNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        generalNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }




  // ART NEWS
  Future<void> fetchArtNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(artNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        artNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }



  // ECONOMY NEWS
  Future<void> fetchEconomyNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(businessNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        economyNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }






  // FUN NEWS
  Future<void> fetchFunNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(funNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        funNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }





  // HEALTH NEWS
  Future<void> fetchHealthNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(healthNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        healthNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }




  // MUSIC NEWS
  Future<void> fetchMusicNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(musicNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        musicNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }




  // SCIENCE NEWS
  Future<void> fetchScienceNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(scienceNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        scienceNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }




  // SPORTS NEWS
  Future<void> fetchSportsNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(sportsNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        sportsNewsList.assignAll(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }




  // TECH NEWS
  Future<void> fetchTechNewsData() async {
    try{
      // isfetching set to true
      stillFetching.value = true;

      // fetching the data and saving it a Response object variable
      Response response = await _getConnect.get(techNewsAPI);

      update();
      
      // status 200 means successful fetch
      if(response.statusCode == 200){
        final newsList = (response.body['articles'] as List ).map((e) => Articles.fromJson(e)).toList();
  
        techNewsList.assignAll(newsList);
        print(newsList);

        // when data is done fetching and is saved we set stillfetching bool to false
        stillFetching.value = false;        
      }     
      
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }






}