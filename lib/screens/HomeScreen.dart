import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_ai/model/chat_message.dart';
import 'package:med_ai/model/const.dart';
import 'package:med_ai/screens/introscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChatMessage> messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _handleSubmitted(String text) {
    _textController.clear();
    _addMessage(ChatMessage(text: text, isUser: true, textStyle: TextStyle()));
    APIService.instance.getGeminiResponse(text, callback: _addMessage);
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      messages.insert(0, message);
    });
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      TextStyle messageTextStyle = TextStyle(
        fontFamily: 'SofiaPro',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

      _addMessage(ChatMessage(
        text: "Summarize the medical Report",
        isUser: true,
        imageFile: file,
        textStyle: messageTextStyle,
      ));

      const String defaultPrompt = """
Please provide a summary of this report as you are analyzing it. Include the following aspects in your summary:
1. Type of report 
2. Patient information 
3. Key findings or test results
4. Any abnormal values or concerning results
5. Doctor's interpretation or comments
6. Recommended follow-up actions
7. Overall health status indication based on the report
8. Overall conclusion of report
    """;

      APIService.instance.getGeminiResponse(defaultPrompt, imageFile: file,
          callback: (ChatMessage message) {
        _addMessage(ChatMessage(
          text: message.text,
          isUser: false,
          imageFile: message.imageFile,
          textStyle: messageTextStyle,
        ));
      });
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "Med AI",
        style: TextStyle(
          fontFamily: 'SofiaPro',
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IntroScreen()),
            );
          },
        ),
      ],
    ),
    body: RefreshIndicator(
      onRefresh: _handleRefresh,
      backgroundColor: Colors.grey[900],
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageItem(messages[index]);
              },
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    ),
  );
}

Future<void> _handleRefresh() async {
  setState(() {
    messages.clear();
  });
}


  Widget _buildMessageItem(ChatMessage message) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: message.isUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (message.imageFile != null)
              GestureDetector(
                onTap: () {
                  _showImageDialog(message.imageFile!.path);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: FileImage(File(message.imageFile!.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Icon(Icons.zoom_in, color: Colors.white),
                ),
              ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: message.isUser ? Colors.white : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: message.isUser
                  ? Text(message.text)
                  : MarkdownBody(
                      data: message.text,
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SofiaPro',
                        ),
                        strong: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SofiaPro',
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(imagePath),
                      width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              cursorColor: Colors.white,
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Send a message",
                hintStyle: TextStyle(
                  fontFamily: 'SofiaPro',
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ), // Border color
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ), // Padding inside
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.image,
                    color: Color(0xFFFFB13D),
                  ),
                  onPressed: _sendMediaMessage,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color(0xFFFFB13D),
                  ),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ),
              style: TextStyle(
                fontFamily: 'SofiaPro',
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              onSubmitted: (_) => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }
}
