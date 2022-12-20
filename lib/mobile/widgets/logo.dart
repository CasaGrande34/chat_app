import 'package:flutter/material.dart';

import '../../utils/add_spaces.dart';

class Logo extends StatelessWidget {
  final String titulo;
  const Logo({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only( top: 50 ),
        width: 170.0,
        child: Column(
          children: [
            Image.asset('assets/logos/tag-logo.png'),
            addVerticalSpace( 20.0 ),
            Text(
              titulo, 
              style: const TextStyle(
                fontSize: 30
            ),)
          ],
        ),
      ),
    );
  }
}
