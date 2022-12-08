import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/widgets/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController{

  late FirebaseAuth auth;

  final user = Rxn<User>();

  late Stream<User?> authStateChanges;

  @override
  void onReady() {
    initializer();
    super.onReady();
  }


  Future<void> initializer() async {
    auth = FirebaseAuth.instance;
    authStateChanges = auth.authStateChanges();

    // checking if the current user is registered or exists
    authStateChanges.listen((User? currentUser) { 
      user.value = currentUser;
    });

  }


  bool validateSignIn(String email, String pswd){
    if(email.isEmpty){
      UserFeedBack.showErrorSnackBar('Email is empty');
      return false;
    }else if(!(email.contains('@') && email.contains('.com'))){
      UserFeedBack.showErrorSnackBar('Invalid Email');
      return false;
    }else if(pswd.isEmpty){
      UserFeedBack.showErrorSnackBar('Password field is empty, please supply the password');
      return false;
    }else if(pswd.length < 8){
      UserFeedBack.showErrorSnackBar('Password must be atleast 8 characters');
      return false;
    }else{
      print("Returned True");
      return true;
    }

  }



  bool validateSignUp(String email, String pswd, String pswd2, String username) {
    if(email.isEmpty){
      UserFeedBack.showErrorSnackBar('Email is empty');
      return false;
    }else if(!(email.contains('@') && email.contains('.com'))){
      UserFeedBack.showErrorSnackBar('Invalid Email');
      return false;
    }else if(username.isEmpty){
      UserFeedBack.showErrorSnackBar('Username field is empty');
      return false;
    }else if(username.length > 15){
      UserFeedBack.showErrorSnackBar('Your username should not exceed 15 characters');
      return false;
    }else if(pswd.isEmpty){
      UserFeedBack.showErrorSnackBar('Password field is empty, please supply the password');
      return false;
    }else if(pswd.length < 8){
      UserFeedBack.showErrorSnackBar('Password must be atleast 8 characters');
      return false;
    }else if(!(pswd == pswd2)){
      UserFeedBack.showErrorSnackBar('Password mismatch. Confirm your password !');
      return false;
    }else{
      print("Returned True");
      return true;
    }

  }


  Future<void> registerUser(String suppliedEmail, String suppliedPassword, String  uName) async {

    try{
      await auth.createUserWithEmailAndPassword(email: suppliedEmail, password: suppliedPassword);
      // if successful
      UserFeedBack.showSuccessSnackBar('Dear ${uName.toUpperCase()}, you have been registered successfully');
      
    } on FirebaseAuthException catch(e){
      UserFeedBack.showErrorSnackBar(e.message!);
    }

  }


  
}

