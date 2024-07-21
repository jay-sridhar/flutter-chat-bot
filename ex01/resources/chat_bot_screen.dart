import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  final String model;

  const ChatbotScreen({super.key, required this.model});

  @override
  ChatbotScreenState createState() => ChatbotScreenState();
}

class ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chatbot (${widget.model})'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final message = _textEditingController.text;
                        _textEditingController.clear();
                       print(message);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    
  }
}
