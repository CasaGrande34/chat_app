import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool isPassword;
  
  const CustomInput({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.textEditingController,
    this.keyboardType =  TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only( top: 5, bottom: 5, left: 5, right: 25 ),
        margin: const EdgeInsets.only( bottom: 20 ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular( 30 ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity( 0.05 ),
              offset: const Offset( 0, 5 ),
              blurRadius: 5,
            )
          ],
        ),
        child: TextField(
          controller: textEditingController,
          autocorrect: false,
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon( icon ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeholder,
          ),
        )
      );
  }
}
