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
  final ScrollController _scrollController = ScrollController();
  bool _isThinking = false;

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
                controller: _scrollController,
                reverse: true,
                itemCount: _messages.length + (_isThinking ? 1 : 0),
                itemBuilder: (context, index) {
                  if (_isThinking && index == 0) {
                    return const ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.hourglass_top,
                        ),
                      ),
                      title: Text(
                        'Thinking...',
                        style: TextStyle(),
                      ),
                    );
                  }
                  final message = _messages[_isThinking ? index - 1 : index];
                  final isUserMessage = message['role'] == 'user';
                  return Container(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? Colors.deepOrange
                            : Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: isUserMessage
                          ? Text(
                              message['content']!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          : Text(
                              message['content']!,
                              style: const TextStyle(color: Colors.black87),
                            ),
                    ),
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

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> _sendMessage(String message) async {
    try {
      setState(() {
        _messages.insert(0, {'role': 'user', 'content': message});
        _isThinking = true;
      });
      _scrollToTop();

      const url = 'http://10.0.2.2:9999/api/chat';
      final request = http.Request(
        'POST',
        Uri.parse(url),
      );
      request.headers['Content-Type'] = 'application/json';
      request.body = json.encode({
        'model': widget.model,
        'messages': _messages.reversed.toList(),
      });

      final response = await request.send();

      if (response.statusCode == 200) {
        final chatbotResponse = StringBuffer();
        bool firstChunkReceived = false;
        await for (final chunk in response.stream.transform(utf8.decoder)) {
          final decodedChunk = json.decode(chunk);
          final content = decodedChunk['message']['content'] as String?;
          if (content != null) {
            if (!firstChunkReceived) {
              setState(() {
                _isThinking = false;
                _messages.insert(0, {
                  'role': 'assistant',
                  'content': content,
                });
                chatbotResponse.write(content);
              setState(() {
                _messages[0]['content'] = chatbotResponse.toString();
              });
              });
              firstChunkReceived = true;
            } else {
              chatbotResponse.write(content);
              setState(() {
                _messages[0]['content'] = chatbotResponse.toString();
              });
            }
            _scrollToTop();
          }
        }
      } else {
        setState(() {
          _isThinking = false;
        });
        print('Error: ${response.statusCode}');
        print('Response: ${await response.stream.bytesToString()}');
      }
    } catch (e, stackTrace) {
      setState(() {
        _isThinking = false;
      });
      print('Exception occurred: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
