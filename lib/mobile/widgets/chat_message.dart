import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  
  final String texto;
  final String uid;
  AnimationController animationController;
  ChatMessage({
    Key? key,
    required this.texto,
    required this.uid,
    required this.animationController,
  }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return FadeTransition(
        opacity: animationController,
        child: SizeTransition(
          sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
          child: Container(
            child: uid == '123' ? MyMessage( texto: texto ) : NotMyMessage( texto: texto,) ,
          ),
        ),
      );
  }
}

class MyMessage extends StatelessWidget {
  final String texto;
  const MyMessage({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5.0,
          right: 5.0,
          left: 50.0,
        ),
        padding: const EdgeInsets.all( 8.0 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 20 ),
          color: const Color(0xff4d9ef6)
        ),
        child: Text( texto, style: const TextStyle( color: Colors.white ), ),
      ),
    );
  }
}

class NotMyMessage extends StatelessWidget {
  final String texto;
  const NotMyMessage({
    Key? key, 
    required this.texto
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5.0,
          left: 5.0,
          right: 50.0,
        ),
        padding: const EdgeInsets.all( 8.0 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 20 ),
          color: const Color(0xffe5e4e8)
        ),
        child: Text( texto, style: const TextStyle( color: Colors.black87 ), ),
      ),
    );
  }
}