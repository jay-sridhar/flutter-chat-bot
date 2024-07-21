# Exercise 2

## Objectives
1. Set up a mock backend server for the chat application
2. Add HTTP dependency to the Flutter project for making API calls

## Implementation Steps

### 1. Configure and Run the Backend Server
Choose one of the following options:

#### Option A: Python
1. Download [`mock_gpt.py`](../resources/mock_gpt.py)
2. Install Flask:
```
pip install Flask
```
3. Run the mock server:
```
python mock_gpt.py
```

#### Option B: Node.js / Express
1. Download [`mockGpt.js`](../resources/mockGPT.js)
2. Initialize the project and install Express:
```
npm init -y
npm install express
```
3. Run the mock server:
```
node mockGpt.js
```

#### Verify the Backend Setup
Test the server by running:
```
curl -X POST http://localhost:9999/api/chat -H "Content-Type: application/json" --no-buffer
```
You should see a streaming response containing random words.

### 2. Add HTTP Dependency to Flutter Project
Update the `pubspec.yaml` file by adding the following line under `dependencies`:
```
http: ^1.2.2
```
## Key Changes

- Implemented a mock backend server to simulate chat responses
- Added HTTP package to the Flutter project for making API requests

## Core Concepts

- Setting up a basic backend server for development
- Integrating external packages in a Flutter project
- Basics of API testing using curl