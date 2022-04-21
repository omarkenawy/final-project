import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tawselaa_app/Palette.dart';
import 'package:tawselaa_app/screens/forgot_screen.dart';
import 'package:tawselaa_app/widgets/Rounded_button.dart';
import '../Palette.dart';
import '../widgets/widgets.dart';
import 'register_screen.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  get emailController => null;

  @override
  Widget build(BuildContext context) {
    var passwordController;
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
            child: SafeArea(
              child: Column(
                children:[
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                      'Need a Ride?',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,),

                      ),
                    ),
                  ),
                  SizedBox(
                    height:100,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric
                        (horizontal:40),
                    child:Column(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              onChanged: (String value) {
                                print(value);
                              },
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                             TextFormField(
                                controller: passwordController,
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
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(onPressed: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FrogotScreen()),
                                );
                                },
                                  child: Text('Forgot password?',style: TextStyle(
                                    color: Colors.white,),),

                                )
                                                          ],
                            ),
                            ]


                  ),
                            Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.black,
                                height: 40,
                                child: MaterialButton(onPressed: (){},
                                child: Text('LOGIN',
                                style: TextStyle(
                                  color: Colors.white,),
                                ),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                              ),
                              Container(
                               decoration: BoxDecoration(
                                 border: Border(
                                bottom:
                                BorderSide(color: Colors.
                                  white, width: 1),
                                  )), // Border // BoxDecoration
                                   ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextButton(onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                    );
                                  },
                                    child: Text('Register Now'),
                                  ),
                                ],
                              )

                              ]
                              ),

                    ]
                  ),
               ),
               ]

              ),
            ),
          ),
        ),
      ],
    );
  }
}



class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key, required this.buttonText,
  }) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
        width:double.infinity,
        decoration:BoxDecoration(color:
        Colors.black),
        child: FlatButton(onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:7.0 ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(buttonText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,)
                  ,),
              ),
            )
        )


    );
  }
}



