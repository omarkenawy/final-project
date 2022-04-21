
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../otp.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);


  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
         begin: Alignment.bottomCenter,
         end: Alignment.center,
         colors: [Colors.white, Colors.transparent],
        ) .createShader(rect),
           blendMode: BlendMode.color,
           child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage( 'images/carpoolllll.png'),
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
        title: Text('Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Center(child: Text('Phone Authentication',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefix: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('+20'),
                        ),
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: FlatButton(
              color: Colors.black,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OTPScreen(_controller.text))
                );
              },
              child: Text('Next',
                  style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    ),
    ]
    );

  }
}
