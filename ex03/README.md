# Exercise 3

## Objectives
1. Integrate the mock GPT API with the chat application
2. Implement and display streaming responses from the backend

## Implementation Steps
1. Update the `chat_bot_screen.dart` file
   - Replace the entire contents with the code from [`chat_bot_screen.dart`](resources/chat_bot_screen.dart)

## Key Changes
- Implemented backend API calls using the HTTP package
- Added a new state variable `_messages` to store chat history
- Implemented handling of streaming API responses
- Updated the UI to display messages using a ListView.builder

## Core Concepts
- Making asynchronous API calls in Flutter
- Handling streaming responses from a backend
- Managing and updating state in a StatefulWidget
- Implementing dynamic list views in Flutter
- Real-time UI updates based on incoming data

## New Features
- Real-time display of incoming messages
- Proper formatting and display of chat history
- Improved user experience with streaming responses

## Tips for Understanding the Code
- Pay attention to the `_sendMessage` function and how it handles the API call
- Notice how the `setState` method is used to update the UI in real-time
- Observe the structure of the ListView.builder and how it renders chat messages