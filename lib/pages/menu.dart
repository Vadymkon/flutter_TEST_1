import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testexample/widgets/elev_button_wrapper.dart';
import 'package:testexample/widgets/textbox_test_wrapper.dart';
import '../extenstion.dart';
import '../generated/l10n.dart';
import 'dialogs/error.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';

// Provider.of<Bill>(context).vmin/

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool isButtonEnabled = false;
  String textInsideButton = "";

  @override
  void initState() {
    super.initState();
    // Listen for changes in the text fields and update the button state
    nameController.addListener(updateButtonState);
    mailController.addListener(updateButtonState);
    messageController.addListener(updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(maxLines: 1, S
            .of(context)
            .menu),
        centerTitle: true,
        titleTextStyle: Theme
            .of(context)
            .textTheme
            .
        labelMedium
            ?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme
                .of(context)
                .unselectedWidgetColor
                .withOpacity(0.9)),
        leading: IconButton(onPressed: () {
          /*openSettings(context);*/
        },
            icon: Icon(Icons.arrow_back, color: Theme
                .of(context)
                .unselectedWidgetColor,)),
        elevation: 0,
      ),
      body:
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(calculateSize(context, 32)),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFieldWrapper(type: TextFieldType.text,
                  sometext: "Name",
                  controller: nameController,),
                TextFieldWrapper(type: TextFieldType.text,
                  sometext: "Email",
                  controller: mailController,),
                TextFieldWrapper(type: TextFieldType.text,
                  sometext: "Message",
                  controller: messageController,),

                //That's button
                Container(
                  margin: EdgeInsets.only(top: calculateSize(context, 30)),
                  constraints: BoxConstraints(
                      minHeight: calculateSize(context, 100),
                      minWidth: calculateSize(context, 400)
                  ),
                  child: Row( //to avoid errors (expanded not in row or column, oao)
                    children: [
                      Expanded(
                        child: ElevButtonWrapper(
                          onPressed: () {
                            SendButton();
                          },
                          child: AutoSizeText(maxLines: 1, textInsideButton == "" ? S.of(context).send : textInsideButton),
                          enabled: isButtonEnabled,
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],),
          ),),
      ),
    );
  }

  void SendButton() async {
    if (isButtonEnabled) {
      setState(() {
        isButtonEnabled = false;
        textInsideButton = "Please wait...";
      });
      print(isButtonEnabled);
      try {
        await createPost(
            nameController.text, mailController.text, messageController.text);
      } catch (e) {
        if (e.toString().contains("OS")) errorMessage(context,"No internet.");
        else errorMessage(context,"Error creating post: $e");
      }
      setState(() {
        isButtonEnabled = true;
        textInsideButton = S
            .of(context)
            .send;
      });
    }
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          mailController.text.isNotEmpty &&
          messageController.text.isNotEmpty
      && isEmail(mailController.text);
    });
  }

  bool isEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w.-]+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)*$',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }

  Future<void> createPost (String name, String mail, String message) async {
    Map<String,String> request = {
      'name':name,
      'email':mail,
      'message':message
    };
    final uri = Uri.parse("https://api.byteplex.info/api/test/contact/");
    final response = await http.post(uri, body: json.encode(request),
      headers: {
        'Content-Type': 'application/json',
      });

    if (response.statusCode == 201){
      errorMessage(context,'POSTED!!!');
      //throw Exception('POSTED!!!');
      //return Post.fromJSON(json.decode(response.body));
    }
    else {
      errorMessage(context,'Failed to ${response.statusCode}');
/*      print(request);
      print(response.body);
      throw Exception('Failed to  + ${response.statusCode}');*/
    }
  }
}