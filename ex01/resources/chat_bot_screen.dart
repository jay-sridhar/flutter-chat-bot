import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  final String model;

  const ChatbotScreen({super.key, required this.model});

  @override
  ChatbotScreenState createState() => ChatbotScreenState();
}

class ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isProcessing = false;

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
              child: _isProcessing
                  ? const CircularProgressIndicator()
                  : Row(
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
                          onPressed: () async {
                            setState(() {
                              _isProcessing = true;
                            });
                            final message = _textEditingController.text;
                            await Future.delayed(const Duration(seconds: 2));
                            _textEditingController.clear();
                            setState(() {
                              _isProcessing = false;
                            });
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
