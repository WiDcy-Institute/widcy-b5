

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:widcy/screen/firebase_auth_verify_otp_screen.dart';

class FirebaseAuthDemoScreen extends StatefulWidget {

  const FirebaseAuthDemoScreen({super.key});

  @override
  State<FirebaseAuthDemoScreen> createState() => _FirebaseAuthDemoScreenState();
}

class _FirebaseAuthDemoScreenState extends State<FirebaseAuthDemoScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print('Error: $e');
      throw("Error $e");
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print('Error: $e');
      throw("Error $e");
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    // String? normalizedNumber = await PhoneNumberUtil.normalizePhoneNumber(phoneNumber: phoneNumber, isoCode: 'KH');
    // print("Phone Number Format : $normalizedNumber");
    // await _auth.verifyPhoneNumber(
    //   phoneNumber: '+855 070 446 696',
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     // Auto-retrieval of the SMS code completed.
    //     // Sign the user in with the received credential.
    //     await _auth.signInWithCredential(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     // Handle verification failure.
    //     print(e.message);
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     // Store the verification ID for later use.
    //     // Present the user with an input field to enter the OTP.
    //     // Use the verification ID and user-entered OTP to complete authentication.
    //     String smsCode = ''; // User-entered OTP
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    //     _auth.signInWithCredential(credential);
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     // Auto-retrieval timed out.
    //     // Handle the case by displaying a dialog to let the user manually enter the OTP.
    //   },
    // );

    // ConfirmationResult confirmationResult = await _auth.signInWithPhoneNumber('+855 070 446 696');

    await _auth.verifyPhoneNumber(
      phoneNumber: '+855 070 446 696',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => FirebaseAuthVerifyOtpScreen()));

  }

  // Future<void> signInWithPhoneNumber(String smsCode) async {
  //   try {
  //     final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: smsCode,
  //     );
  //     await _auth.signInWithCredential(credential);
  //     // You can handle the signed in user here.
  //   } catch (e) {
  //     // Handle sign in error.
  //     print('Sign In Error: $e');
  //   }
  // }

  // void startPhoneNumberVerification(String phoneNumber) {
  //   verifyPhoneNumber(phoneNumber);
  // }
  //
  // void verifySmsCode(String smsCode) {
  //   signInWithPhoneNumber(smsCode);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: (){
            String phoneNo = "070446696";
            verifyPhoneNumber(phoneNo);
            //registerWithEmailAndPassword("chivon.chhai.kh@gmail.com","123456");
          },
        ),
      ),
    );
  }
}
