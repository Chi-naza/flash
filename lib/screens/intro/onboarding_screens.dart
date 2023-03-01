import 'package:flash/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {

  // instance of auth controller
  Authcontroller authcontroller = Get.find<Authcontroller>();

  // A function which arranges and returns our Onboarding Screen Images
  Widget onboardingImage(String imageUrl) {
    return Align(
      child: Image.asset('$imageUrl', width: 220.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    //this is a page decoration for intro screen
    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0, 
        fontWeight: FontWeight.w700, 
        color:Colors.white 
      ), //tile font size, weight and color
      bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.white), 
      //body text size and color
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //decription padding
      imagePadding: EdgeInsets.all(20), //image padding
      boxDecoration:BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.orange,
            Colors.deepOrangeAccent,
            Colors.red,
            Colors.redAccent,
          ],
        ),
      ), //show linear gradient background of page  
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.deepOrangeAccent,
      //main background of screen
      pages: [ //set your page view here
        PageViewModel(
          title: "The Home of News",
          body: "Instead of moving from one place to another, we bring the news to where you are.",
          image: onboardingImage('assets/images/logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "The Voices of People",
          body: "A privilege to get firsthand information from the world over. Listen to the heartbeat of people. Hear the voices of people",
          image: onboardingImage('assets/images/mic.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "No need to hold the papers",
          body: "Get all the news you need. You don't have to continue buying the papers, get it all those news here",
          image: onboardingImage('assets/images/newspaper.png'),
          decoration: pageDecoration,
        ),
        //add more screen here
      ],
      //go to home page if logged in
      onDone: () {
        if(authcontroller.isUserLoggedIn()){
          authcontroller.goToHomeScreen();
        }else{
          authcontroller.goToLoginScreen();
        }
      }, 
      //go to home page if logged in
      onSkip: () {
        if(authcontroller.isUserLoggedIn()){
          authcontroller.goToHomeScreen();
        }else{
          authcontroller.goToLoginScreen();
        }
      },  // You can override on skip 
      showSkipButton: true,
      // skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip', style: TextStyle(color: Colors.white),),
      next: const Icon(Icons.arrow_forward, color: Colors.white,),
      done: const Text(
        'Getting Stated', 
        style: TextStyle(
          fontWeight: FontWeight.w600, color:Colors.white
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.white, //color of dots
        activeSize: Size(22.0, 10.0),
        // activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder( //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}