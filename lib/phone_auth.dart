import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tawselaa_app/screens/home_page.dart';
import 'package:tawselaa_app/screens/login_page.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController(text: "+20");
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.white, Colors.transparent],
                ).createShader(rect),
            blendMode: BlendMode.color,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/carpoolllll.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white,
                      BlendMode.darken),
                ),
              ),
            ),
          ),

          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,

              title: Text("Phone verification"),
            ),
            body: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: "Phone number"),
                    keyboardType: TextInputType.phone,
                  ),

                  Visibility(child: TextField(
                    controller: otpController,
                    decoration: InputDecoration(),
                    keyboardType: TextInputType.number,
                  ), visible: otpVisibility,),

                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (otpVisibility) {
                          verifyOTP();
                        }
                        else {
                          loginWithPhone();
                        }
                      },
                      child: Text(otpVisibility ? "Login" :"Verify" )),
                ],
              ),
            ),
          ),
        ]
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    },
    );
  }
}
