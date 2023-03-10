import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController PHONECONTROLLER = TextEditingController(text: "+917731831827");
  TextEditingController OTPCODECONTROLLER = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationIDRecived = "";

  bool otpCodeVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn With Mobile.'),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: PHONECONTROLLER,
              decoration: const InputDecoration(label: Text("MOBILE_NUMBER")),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: otpCodeVisible,
              child: TextField(
                controller: OTPCODECONTROLLER,
                decoration:
                    const InputDecoration(label: Text("ENTER OTP HERE")),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  //OTP API (ONCLICK EVENT)
                  if(otpCodeVisible){
                    verifyCode();
                  }
                  else {
                    verifyNumber();
                  }
                },
                child: Text(otpCodeVisible ? "Login" : "Verify"))
          ],
        ),
      ),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: PHONECONTROLLER.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print('u r logged in sucessfully');
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDRecived = verificationID;
          otpCodeVisible = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (StringverificationID) {});
  }

  Future<void> verifyCode() async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIDRecived, smsCode: OTPCODECONTROLLER.text);
    await auth.signInWithCredential(credential).then((value) {
      if (kDebugMode) {
        print("you are logged in successfully");
      }
    });
    }
  }
