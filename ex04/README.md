# Exercise 4: Enhancing Chat UI and User Experience

## Objectives
1. Improve usability by automatically scrolling messages to the top while streaming
2. Implement a visual indicator when the user's message is being processed by the LLM
3. Visually differentiate user messages from assistant messages

## Implementation Steps
1. Update the `chat_bot_screen.dart` file
   - Replace the entire contents with the code from [`chat_bot_screen.dart`](resources/chat_bot_screen.dart)

## Key Changes
- Added a `ScrollController` to manage automatic scrolling of the ListView
- Introduced an `_isThinking` state variable to control the display of a processing indicator
- Implemented conditional styling for messages based on their role (user or assistant)
- Replaced the CircularProgressIndicator with a custom hourglass icon for the thinking state

## Core Concepts
- State management in Flutter (again): Using `setState` to update UI based on changes in data or processing state
- Conditional styling: Creating visually distinct message bubbles for user and assistant

## Tips for Understanding the Code
- The `ListView.builder` is set to `reverse: true`, which inverts the scroll direction and item order
- The `_isThinking` variable controls the visibility of the processing indicator and affects the index calculation in the ListView
- The `_scrollToTop()` method is called after each message update to ensure the latest content is visible
- The `itemBuilder` in ListView.builder uses conditional logic to render either the thinking indicator or a message bubble
- Message bubbles are created using nested `Container` widgets with custom styling based on the message role