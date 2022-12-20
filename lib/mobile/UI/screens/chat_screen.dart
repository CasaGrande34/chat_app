import 'dart:io';

import 'package:chat_app/mobile/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//dependencies

//file addresses
import 'package:chat_app/utils/add_spaces.dart';

class ChatScreen extends StatefulWidget {
  
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  bool writing = false;
  final focusNode = FocusNode();
  final textController = TextEditingController();
  
  List<ChatMessage> messages = [];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                maxRadius: 16,
                backgroundColor: Colors.blue[100],
                child: const Text('Te', style: TextStyle(fontSize: 12),),
              ),
              addVerticalSpace( 3 ),
              const Text('Melisa Flores', style:  TextStyle( color: Colors.black87, fontSize: 12),) 
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, i) => messages[i],
                  reverse: true,
                )
              ),
              const Divider( height: 1),
              
              //Caja de Texto
              Container(
                color: Colors.white,
                
                child: InputChat(
                  focusNode: focusNode,
                  handleSubmit: handleSubmit, 
                  textEditingController: textController, 
                  writing: writing,
                )
              )
            ],
          ),
        )
   );
  }

  handleSubmit(String texto) {
    
    //!Si el texto esta vacio entonces no puedo enviar nada, se corta la cadena de logicas aca.
    if(texto.isEmpty) return;
        
    textController.clear();
    focusNode.requestFocus();
    
    final newMessage = ChatMessage( 
      texto: texto, 
      uid: '123',
      animationController: AnimationController(vsync: this, duration: const Duration( milliseconds: 400 )),
    );
    messages.insert(0, newMessage);
    newMessage.animationController.forward();
    
    setState(() {
      writing = false;
    });
    
    //!Cerramos los animationControllers!
    @override
    void dispose() {
      
      for (ChatMessage message in messages) {
        message.animationController.dispose();
      }
      super.dispose();
    }
  }
}

class InputChat extends StatefulWidget {
  bool writing;
  final TextEditingController textEditingController;
  final Function(String) handleSubmit;
  final FocusNode focusNode;  
  InputChat({
    Key? key,
    required this.writing,
    required this.textEditingController,
    required this.handleSubmit,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 8.0 ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: widget.textEditingController,
                onSubmitted: widget.handleSubmit,
                onChanged: (text) {
                  setState(() {
                    if( text.trim().isNotEmpty ) {
                      widget.writing = true;
                    } else {
                      widget.writing = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje',
                ),
                focusNode: widget.focusNode,
              ),
            ),
            
            //Boton de enviar
            Container(
              margin: const EdgeInsets.symmetric( horizontal: 4.0 ),
              //!IOS
              child: Platform.isIOS? CupertinoButton(
                onPressed: widget.writing ? () => widget.handleSubmit( widget.textEditingController.text.trim() ) : null,
                child: const Text('Enviar'),
              ) 
              //!ANDROID
              : Container(
                margin: const EdgeInsets.symmetric( horizontal: 4.0 ),
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.blue[400]
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.send),
                    onPressed: widget.writing ? () => widget.handleSubmit( widget.textEditingController.text.trim() ) : null,
                  ), 
                ),
              )
            )
          ],
        ),
      ),
    );
    }
}
