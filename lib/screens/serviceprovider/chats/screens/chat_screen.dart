import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../../client/chat/models/message_model.dart';
import '../../../client/chat/models/user_model.dart';


class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color:  Color.fromRGBO(2, 56, 89, 1.0),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color:  Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: GoogleFonts.acme(
                  color: WhiteColor,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.time,
                      style: GoogleFonts.acme(
                        fontSize: 12,
                        color:  Color.fromRGBO(2, 56, 89, 1.0),
                      ),
                    ),
                   const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color:  Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: WhiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color:  Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: GoogleFonts.acme(
                  color:  Color.fromRGBO(2, 56, 89, 1.0),
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  YellowColor,
                        boxShadow: [
                          BoxShadow(
                            color:  YellowColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                   const  SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.time,
                      style: GoogleFonts.acme(
                        fontSize: 12,
                        color:  YellowColor,
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: WhiteColor,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add_photo_alternate_rounded,color:  YellowColor,),
            iconSize: 25,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message..',
                hintStyle: GoogleFonts.acme(
                  color:  YellowColor.withOpacity(0.6)
                )
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send_rounded),
            iconSize: 25,
            color: Color.fromRGBO(2, 56, 89, 1.0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int? prevUserId;
    return Scaffold(
      backgroundColor: WhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Transparent,
        title: Container(
          width: 35,
          height: 45,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: WhiteColor,
              boxShadow: [
                BoxShadow(
                  color: BlueColor,
                  offset: Offset(0, 1),
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                ),
              ]
          ), //icon inside button,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back, color: YellowColor, size: 20,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0,top: 15),
            child: Text(
                widget.user.name,
                style: GoogleFonts.acme(
                  fontSize: 20,
                  color: YellowColor
                )),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser =  prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}
