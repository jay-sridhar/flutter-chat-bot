import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotScreen extends StatefulWidget {
  final String model;

  const ChatbotScreen({super.key, required this.model});

  @override
  ChatbotScreenState createState() => ChatbotScreenState();
}

class ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Map<String, String>> _messages = [];

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
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                   
                    title: Text(message['content'] ?? ''),
                  );
                },
              ),
            ),
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
                      if (message.isNotEmpty) {
                        _textEditingController.clear();
                        _sendMessage(message);
                      }
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

  Future<void> _sendMessage(String message) async {
    try {
      setState(() {
        _messages.add({'role': 'user', 'content': message});
      });
      
      const url = 'http://10.0.2.2:9999/api/chat';
      final request = http.Request(
        'POST',
        Uri.parse(url),
      );
      request.headers['Content-Type'] = 'application/json';
      request.body = json.encode({
        'model': widget.model,
        'messages': _messages,
      });

      final response = await request.send();

      if (response.statusCode == 200) {
        final chatbotResponse = StringBuffer();
        await for (final chunk in response.stream.transform(utf8.decoder)) {
          final decodedChunk = json.decode(chunk);
          final content = decodedChunk['message']['content'] as String?;
          if (content != null) {
            chatbotResponse.write(content);
            setState(() {
              if (_messages.last['role'] == 'assistant') {
                _messages.last['content'] = chatbotResponse.toString();
              } else {
                _messages.add({
                  'role': 'assistant',
                  'content': chatbotResponse.toString()
                });
              }
            });
          }
        }
      } else {
        print('Error: ${response.statusCode}');
        print('Response: ${await response.stream.bytesToString()}');
      }
    } catch (e, stackTrace) {
      print('Exception occurred: $e');
      print('Stack trace: $stackTrace');
    }
  }
}