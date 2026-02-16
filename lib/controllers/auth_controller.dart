import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/screens/auth/signin_screen.dart';
import 'package:flash/screens/home/home_screen.dart';
import 'package:flash/utilities/firebase_services.dart';
import 'package:flash/widgets/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> user = Rxn<User>();
  StreamSubscription<User?>? _authSub;

  @override
  void onInit() {
    super.onInit();
    // Keeps user reactive across app lifetime
    _authSub = _auth.authStateChanges().listen((User? currentUser) {
      user.value = currentUser;
    });
  }

  @override
  void onClose() {
    _authSub?.cancel();
    super.onClose();
  }

  // -------- Validation much more cleaner --------
  bool validateSignIn(String email, String pswd) {
    if (email.trim().isEmpty) {
      UserFeedBack.showErrorSnackBar('Email is empty');
      return false;
    }
    if (!GetUtils.isEmail(email.trim())) {
      UserFeedBack.showErrorSnackBar('Invalid Email');
      return false;
    }
    if (pswd.isEmpty) {
      UserFeedBack.showErrorSnackBar(
          'Password field is empty, please supply the password');
      return false;
    }
    if (pswd.length < 8) {
      UserFeedBack.showErrorSnackBar('Password must be at least 8 characters');
      return false;
    }
    return true;
  }

  bool validateSignUp(
      String email, String pswd, String pswd2, String username) {
    if (email.trim().isEmpty) {
      UserFeedBack.showErrorSnackBar('Email is empty');
      return false;
    }
    if (!GetUtils.isEmail(email.trim())) {
      UserFeedBack.showErrorSnackBar('Invalid Email');
      return false;
    }
    if (username.trim().isEmpty) {
      UserFeedBack.showErrorSnackBar('Username field is empty');
      return false;
    }
    if (username.length > 15) {
      UserFeedBack.showErrorSnackBar(
          'Your username should not exceed 15 characters');
      return false;
    }
    if (pswd.isEmpty) {
      UserFeedBack.showErrorSnackBar(
          'Password field is empty, please supply the password');
      return false;
    }
    if (pswd.length < 8) {
      UserFeedBack.showErrorSnackBar('Password must be at least 8 characters');
      return false;
    }
    if (pswd != pswd2) {
      UserFeedBack.showErrorSnackBar(
          'Password mismatch. Confirm your password!');
      return false;
    }
    return true;
  }

  // -------- Auth --------

  Future<void> registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ); // :contentReference[oaicite:4]{index=4}

      final u = cred.user;
      if (u == null) {
        UserFeedBack.showErrorSnackBar('Registration failed. Try again.');
        return;
      }

      await userReference.doc(email.toLowerCase()).set(
        {
          'uid': u.uid,
          'email': u.email?.toLowerCase(),
          'username': username.trim(),
          'image': '',
          'date_registered': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );

      UserFeedBack.showSuccessSnackBar(
        'Dear ${username.toUpperCase()}, you have been registered successfully',
      );

      goToLoginScreen();
    } on FirebaseAuthException catch (e) {
      UserFeedBack.showErrorSnackBar(_friendlyAuthError(e));
    } catch (e) {
      UserFeedBack.showErrorSnackBar('Something went wrong. Please try again.');
      if (kDebugMode) debugPrint('registerUser error: $e');
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      UserFeedBack.showSuccessSnackBar('Login Successful!');
      goToHomeScreen();
    } on FirebaseAuthException catch (e) {
      UserFeedBack.showErrorSnackBar(_friendlyAuthError(e));
    } catch (e) {
      UserFeedBack.showErrorSnackBar('Something went wrong. Please try again.');
      if (kDebugMode) debugPrint('loginUser error: $e');
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      UserFeedBack.showSuccessSnackBar('Logout successful!');
      goToLoginScreen();
    } catch (e) {
      if (kDebugMode) debugPrint('logoutUser error: $e');
    }
  }

  void goToLoginScreen() => Get.offAllNamed(SignInScreen.routeName);
  void goToHomeScreen() => Get.offAllNamed(HomeScreen.routeName);

  User? currentUserDetails() => _auth.currentUser;
  bool isUserLoggedIn() => _auth.currentUser != null;

  String _friendlyAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Invalid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'user-not-found':
        return 'No account found for that email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'Email is already in use.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'network-request-failed':
        return 'Network error. Check your connection.';
      default:
        return e.message ?? 'Authentication error. Please try again.';
    }
  }
}
