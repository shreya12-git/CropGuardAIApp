import 'package:flutter/material.dart';

class ChatBotPage extends StatefulWidget{
  const ChatBotPage({super.key,required this.title});
  final String title;
  @override
  State<ChatBotPage> createState()=>_ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage>{

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return  Scaffold(
         appBar: AppBar(
        backgroundColor: const Color(0xFF88C431),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/logo.png'),
          ),
        ),
        title: const Text(
          'CropGuardAI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
  );
  }
}