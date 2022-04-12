import 'package:flutter/material.dart';

// Any Dart program, whether it's a command-line app, an AngularDart app,
// or a Flutter app, starts with a main() function.
void main() {
  // The runApp() function takes as its argument a Widget,
  // which the Flutter framework expands and displays to the screen at run time.
  // This chat app uses Material Design elements in the UI
  // A MaterialApp object is created and passed to the runApp() function.
  // The MaterialApp widget becomes the root of your app's widget tree.
  // The home argument specifies the default screen that users see in your app.
  // In this case, it consists of a Scaffold widget that has a simple AppBar as its child widget.

  // The MaterialApp code is placed in a new stateless widget called FriendlyChatApp, and
  // main() is updated to call that class when it calls the runApp() function.
  // Simplifying the main() method enables hot reload because hot reload doesn't rerun main().

//  @override is a Dart annotation that indicates that the tagged method overrides a superclass's method.
  runApp(
    FriendlyChatApp(),
  );
}

// stateless widget
class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  // Prefixing an identifier with an underscore (_) makes the identifier private to its library.
  // A library bundles a set of classes, constants, functions, typedefs, properties, and exceptions
  // into one package to enforce privacy.
  @override
  State<ChatScreen> createState() => _ChatScreenState(); // For managing state.
}

class _ChatScreenState extends State<ChatScreen> {
  // TextEditingController object for reading and clearing the contents of the input field
  // Manage interactions with the text field
  final _textController = TextEditingController();

  void _handleSubmitted(String text) {
    // clear text onSubmitted
    _textController.clear();
  }

  // private method that returns a Container widget with a configured TextField
  // The Container widget adds a horizontal margin between the edge of the screen and each side of the input field.
  // The onSubmitted property provides a private callback method, _handleSubmitted()
  // The TextField with the TextEditingController (_textController) gives you control over the text field.
  // This controller will clear the field and read its value.
  // Row allows you to place the Send button adjacent to the input field.
  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold and AppBar, are specific to Material Design apps
    // Other widgets, like Text, are generic and can be used in any app.
    // Adding _buildTextComposer to the body property causes the app to display the text input user control.
    return Scaffold(
      appBar: AppBar(title: Text('FriendlyChat')),
      body:
          _buildTextComposer(), // the _buildTextComposer method returns a widget that encapsulates the text input field.
    );
  }
}
