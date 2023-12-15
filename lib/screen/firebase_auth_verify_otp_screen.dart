import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthVerifyOtpScreen extends StatefulWidget {

  FirebaseAuthVerifyOtpScreen({super.key});

  @override
  State<FirebaseAuthVerifyOtpScreen> createState() => _FirebaseAuthVerifyOtpScreenState();
}

class _FirebaseAuthVerifyOtpScreenState extends State<FirebaseAuthVerifyOtpScreen> {

  TextEditingController _textEditingController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyOTP(String otpCode) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+855 070 446 696',
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = otpCode;
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        print("Token : ${credential.accessToken}");
        // Sign the user in (or link) with the credential
        await _auth.signInWithCredential(credential);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {

      },
      verificationFailed: (FirebaseAuthException error) {

      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your text',
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            String enteredText = _textEditingController.text;
            // Do something with the enteredText
            print('Entered text: $enteredText');
            verifyOTP(enteredText);
          }, child: Text("Verify OTP"))
        ],
      )
    );
  }
}
