import 'package:flutter/material.dart';

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
