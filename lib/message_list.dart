import 'package:bipolar_assignment/message.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final String heroTag;
  MessageList(this.heroTag);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(5),
                // padding: EdgeInsets.all(5),
                width: 30,
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Hero(
                    tag: heroTag,
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2020/11/02/13/15/reindeer-5706627_960_720.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border:
                        Border.all(color: const Color(0xffffffff), width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x69000000),
                          offset: Offset(0, 0),
                          blurRadius: 3,
                          spreadRadius: 0)
                    ])),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User1'),
                Text('Last seen today', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Today'),
                ),
                elevation: 2,
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  MessageWidget(
                    content: 'Hello',
                    isImage: true,
                    isVideo: false,
                    isAudio: false,
                    isSent: true,
                    imageAddress:
                        'https://cdn.pixabay.com/photo/2020/11/02/13/15/reindeer-5706627_960_720.png',
                    time: '12:43 pm',
                  ),
                  MessageWidget(
                    isImage: false,
                    isAudio: true,
                    isSent: false,
                    isVideo: false,
                    time: '12:48 pm',
                  ),
                  MessageWidget(
                    content: 'Hello',
                    isImage: false,
                    isAudio: false,
                    isSent: true,
                    isVideo: true,
                    // imageAddress: 'https://cdn.pixabay.com/photo/2020/11/02/13/15/reindeer-5706627_960_720.png',
                    time: '12:55 pm',
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Type your message here...'),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
