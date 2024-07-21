## Flutter Installation

1. Visit the [official Flutter installation page](https://docs.flutter.dev/get-started/install) for detailed instructions.

2. Select your operating system:
   - For Windows users: Choose "Android"
   - For Mac users: Choose "Android" (Important!)

3. Recommended method: Install Flutter using Visual Studio Code
   - Open VS Code
   - Navigate to the Extensions view (Ctrl+Shift+X or Cmd+Shift+X)
   - Search for "Flutter"
   - Install the official Flutter extension

4. Follow the extension's setup wizard to complete the Flutter installation

5. Verify the installation by opening a new terminal in VS Code and running:
    ```
    flutter doctor
    ```

## Creating a New Flutter Application

1. Access the Command Palette:
   - Windows: Press `Ctrl + Shift + P`
   - Mac: Press `Cmd + Shift + P`

2. Type "Flutter: New Project" and select it from the list

3. Choose "Application" from the project type options
   - This creates a Flutter application with descriptive comments and tests

4. Select a directory where you want the new project to be created

5. Enter a project name (e.g., "chat_assistant" or any name of your choice)

6. Wait for VS Code to set up the new Flutter project

7. Once complete, you'll see the project structure in the VS Code explorer

## Running the App

### Prerequisites

- Android Studio (Windows and Mac) or Xcode (Mac only)
- A configured target device for running the app:
  - [Configure Android device for Windows](https://docs.flutter.dev/get-started/install/windows/mobile#configure-your-target-android-device)
  - [Configure Android device for Mac](https://docs.flutter.dev/get-started/install/macos/mobile-android#configure-your-target-android-device)
- Choose an emulator from the available list (e.g., Pixel 6 Pro)
- Verify the setup by starting the device from the device manager

### Running the Application

1. Open the Command Palette:
   - Windows: `Ctrl + Shift + P`
   - Mac: `Cmd + Shift + P`

2. Type and select 'Flutter: Launch Emulator'

3. Choose the device you configured

4. Open `main.dart` in your project

5. Click on "Run Without Debugging" or press:
   - Windows: `Ctrl + Shift + F5`
   - Mac: `Cmd + Shift + F5`

6. Wait for the app to build and run (this may take a while on first launch)

7. If successful, you'll see the Flutter demo home page in the emulator

Congratulations! Your Flutter development environment is now set up and ready for use.
