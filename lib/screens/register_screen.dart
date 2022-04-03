
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tawselaa_app/screens/login_page.dart';
import 'package:tawselaa_app/widgets/password_input.dart';
import 'package:tawselaa_app/widgets/text_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
            body: SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(height: size.width*0.1,),
                 Stack(
                   children:[Column(
                     children: [
                       Center(
                         child: ClipOval(
                           child: BackdropFilter(
                             filter: ImageFilter.blur(sigmaX: 3,
                             sigmaY: 3),
                             child: CircleAvatar(
                                 radius:size.width * 0.14,
                                 backgroundColor: Colors.grey[400]?.withOpacity(0.4,),
                                 child: Icon(
                                   FontAwesomeIcons.user,
                                   color: Colors.white,
                                   size: size.width*0.1,
                                 )
                             ),
                           ),
                         ),
                       ),
                       Positioned(
                         top:size.height*0.3,
                         left: size.width*0.56,
                         child: Container(
                             height: size.width*0.1,
                             width:size.width*0.1,
                             decoration: BoxDecoration(
                                 color: Colors.blue,
                                 shape: BoxShape.circle,
                                 border: Border.all(
                                   color: Colors.white,width:2,
                                 )),
                           child: Icon(FontAwesomeIcons.arrowUp,
                           color: Colors.white,
                           ),
                         ),
                       )
                     ],
                   ),]
                 ),
                  SizedBox(height: size.width*0.1,),
                Column(
                  children: [
                    TextInput(icon:FontAwesomeIcons.user,
                    hint:'First Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInput(icon:FontAwesomeIcons.user,
                      hint:'Second Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInput(icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.next, inputType: TextInputType.none,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done, inputType: TextInputType.none,
                    ),
                    Row(
                      children:[
                        Container(
                          width: 80,
                          child: Text(
                            'Gender:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(width: 40,),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(Icons.tag_faces,color:Colors.grey),
                        ),
                        SizedBox(width: 30,),
                        Container(
                          width: 70.0,
                          child: (
                          Text('Male',style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                          )
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(Icons.face,color:Colors.grey),
                        ),
                        SizedBox(width: 30,),
                        Container(
                          width: 70.0,
                          child: (
                              Text('Female',style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.left,
                              )
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 25,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(children:[

                      ],
                    ),
                    RoundedButton(buttonText: 'Register'),
                    SizedBox(width: 0.10,),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                      child: Text('Already Have an Account?'),
                    ),


                  ],

                )
                    ]
          ),
              ]
            ),
          )
    )
          ]
          );


  }
}
