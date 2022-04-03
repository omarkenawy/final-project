
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tawselaa_app/screens/login_page.dart';
import 'package:tawselaa_app/screens/register_screen.dart';
import 'package:tawselaa_app/widgets/text_input.dart';

class FrogotScreen extends StatelessWidget {
  const FrogotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.white, Colors.transparent],
          ).createShader(rect),
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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
            title: Text('Forgot Password',style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,),
        ),
            centerTitle: true,
        ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox( height: size.height*0.1,),
                    Container(
                      width: size.width * 0.8,
                      child: Text('Enter your Email we will send instruction to reset your password', style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,)
                        ,),
                    ),
                    SizedBox(height: 20,),
                    TextInput(
                      icon: FontAwesomeIcons.solidEnvelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      height: 40,
                      child: MaterialButton(onPressed: (){},
                        child: Text('Send',
                          style: TextStyle(
                            color: Colors.white,),
                        ),
                      ),
                    ),

                  ],
                ),
              )
          ],),
        )
      ],
    );
  }
}