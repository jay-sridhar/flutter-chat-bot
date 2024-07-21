# Exercise 1

## Objectives
1. Transform the MyHomePage widget from stateful to stateless
2. Implement a new 'Chat bot' screen with basic functionality
3. Set up navigation between the home page and chat bot screen

## Implementation Steps
1. Create a new file named `chat_bot_screen.dart`
   - Copy the provided code from [`chat_bot_screen.dart`](resources/chat_bot_screen.dart)
2. Update the `main.dart` file
   - Replace the entire contents with the code from [main.dart](resources/main.dart)

## Key Changes
- Convert MyHomePage to a stateless widget
- Add a button on the home screen to navigate to the chat bot
- In chat_bot_screen.dart:
  - Implement a text input field with a controller
  - Add a 'Send' button for messages
  - Create an event listener to capture entered text

## Core Concepts
- Distinction between stateful and stateless widgets
- Passing data between classes
- Implementing and using event listeners
- Basic app navigation
- Managing state variables