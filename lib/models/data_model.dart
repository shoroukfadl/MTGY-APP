import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

List filedata = [
  {
    'name': 'Chuks Okwuenu',
    'pic': 'https://picsum.photos/300/30',
    'message': 'I love to code',
    'date': '2021-01-01 12:00:00'
  },
  {
    'name': 'Biggi Man',
    'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
    'message': 'Very cool',
    'date': '2021-01-01 12:00:00'
  },
  {
    'name': 'Tunde Martins',
    'pic': 'assets/img/userpic.jpg',
    'message': 'Very cool',
    'date': '2021-01-01 12:00:00'
  },
  {
    'name': 'Biggi Man',
    'pic': 'https://picsum.photos/300/30',
    'message': 'Very cool',
    'date': '2021-01-01 12:00:00'
  },
];

Widget commentChild(data) {
  return ListView(
    children: [
      for (var i = 0; i < data.length; i++)
        Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () async {
                // Display the image in large form.
                print("Comment Clicked");
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: CommentBox.commentImageParser(
                        imageURLorPath: data[i]['pic'])),
              ),
            ),
            title: Text(
              data[i]['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(data[i]['message']),
            trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
          ),
        )
    ],
  );
}