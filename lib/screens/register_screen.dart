
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tawselaa_app/phone_auth.dart';
//import 'package:tawselaa_app/phone_auth.dart';
import 'package:tawselaa_app/screens/login_page.dart';
import 'package:tawselaa_app/widgets/password_input.dart';
import 'package:tawselaa_app/widgets/text_input.dart';

class RegisterScreen extends StatelessWidget {
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: namecontroller,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration
                          (labelText: 'Full Name',
                          prefixIcon: Icon(
                            Icons.person,
                          ) ,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration
                          (labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                          ) ,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        controller: phonecontroller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration
                          (labelText: 'Phone number',
                          prefixIcon: Icon(
                            Icons.phone,
                          ) ,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          border: OutlineInputBorder(),
                        ),
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
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(width: 4,),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(Icons.tag_faces,color:Colors.grey),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 70.0,
                            child: (
                            Text('Male',style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                            )
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(Icons.face,color:Colors.grey),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 70.0,
                            child: (
                                Text('Female',style: TextStyle(fontSize: 16),
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
                      //RoundedButton(buttonText: 'Register'),
                      Container(
                        width: double.infinity,
                        color: Colors.black,
                        child:MaterialButton(
                          onPressed: (){
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder:(context)=>PhoneAuth(),
                              ),
                            );
                          },
                          height: 50,
                          child:Text('Register',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                          ,
                        )
                      ),
                      SizedBox(width: 0.10,),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                            child: Text('Already Have an Account?'),
                          ),


                    ],

                  )
                      ]
          ),
                ),
              ]
            ),
          )
    )
          ]
          );


  }
}


