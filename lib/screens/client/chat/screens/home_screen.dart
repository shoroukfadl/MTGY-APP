import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../../serviceprovider/chats/models/message_model.dart';
import '../../../serviceprovider/chats/screens/chat_screen.dart';




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      appBar: AppBar(
        backgroundColor: Transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
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
                icon: const Icon(Icons.arrow_back,
                  color: YellowColor, size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              'Chats',
              style: GoogleFonts.acme(
                color:   BlueColor,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return InkWell(
            borderRadius: BorderRadius.circular(70),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: chat.sender,
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: chat.unread
                        ? BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              width: 2,
                              color:  YellowColor,
                            ),
                            // shape: BoxShape.circle,

                          )
                        : BoxDecoration(
                            shape: BoxShape.circle,
                           color: YellowColor,
                          boxShadow: [
                              BoxShadow(
                                color: YellowColor.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(chat.sender.imageUrl),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              chat.sender.name,
                              style: GoogleFonts.patrickHand(
                                fontSize: 18,
                                fontWeight:   FontWeight.bold,
                                color:   BlueColor,
                              ),
                            ),
                            Text(
                              chat.time,
                              style: GoogleFonts.patrickHand(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: BlueColor,
                              ),
                            ),
                          ],
                        ),
                       const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            chat.text,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 13,
                              color:  YellowColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
