import 'package:flutter/material.dart';

//dependencies

//file addresses


class LoadingScreen extends StatelessWidget {
  
  const LoadingScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: Text(
            
            'LoadingScreen', 
            
            style: TextStyle(
                                  
              fontSize: 20,
          ),
        ),
     ),
   );
  }
}