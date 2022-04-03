
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +1-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              //onsumbit: (string pin) => _showSnackBar(pin),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
            ),
          )
        ],


      ),
    );
  }

    verifyPhone()async{
      await FirebaseAuth.instance.verifyPhoneNumber(
          verifyPhoncseNumber: '+20${widget.phone}',
          verificationCompleted:(PhoneAuthCredential credential) async {
           await FireBase.instance;
          },
          verificationFailed: (FirebaseAuthException e){
            print(e.message);
          },
          codeSent: (String verficationID, int resendToken){
          setState(() {
        _verificationCode = verficationID;

       });

    },
    codeAutoRetrievalTimeout: (String verificationID){
  setState(() {
  _verificationCode = verficationID;

  });
  },
  timeout: Duration(seconds:60));
  }
 }

