import 'package:firebase_auth/firebase_auth.dart';
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
  
}

