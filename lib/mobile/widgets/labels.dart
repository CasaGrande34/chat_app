import 'package:flutter/material.dart';

import '../../utils/add_spaces.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String title;
  final String subtitle;
  const Labels({
    Key? key,
    required this.ruta,
    this.title   = '',
    this.subtitle= '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Cambie por un sizedbox un container quizas mas adelante fernando le agregue cosas y vuelva a container
    return SizedBox(
      child: Column(
        children: [
          Text(
            title, style: const TextStyle( color: Colors.black54, fontSize: 15.0, fontWeight: FontWeight.w300 ),
          ),
          addVerticalSpace(10),
          GestureDetector(
            onTap: () {
              
              Navigator.of(context).pushReplacementNamed( ruta );
            },
            child: Text(
              subtitle, 
              style: TextStyle( color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold ),
            ),
          )
        ],
      ),
    );
  }
}

