import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.
              symmetric(vertical: 20 ),
              border:InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 22,
                color: Colors.white,),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20 ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              )
          ) ,
          obscureText: true,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: inputAction,
        ) ,
      ),
    );
  }
}
