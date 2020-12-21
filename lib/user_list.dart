import 'package:bipolar_assignment/message_list.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users List',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Container(
        child: Column(children: [
          // Expanded(
          // child:
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: Container(
                    // padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Hero(
                        tag: 'user1',
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2020/11/02/13/15/reindeer-5706627_960_720.png',
                          height: 80.0,
                          width: 80.0,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/user.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(
                            color: const Color(0xffffffff), width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x69000000),
                              offset: Offset(0, 0),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ])),
                title: Text('User1'),
                subtitle: Text('loreum ipsum'),
                trailing: Text('5:41 pm'),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: MessageList('user1')));

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => MessageList('user1'),
                  // ));
                },
              ),
              ListTile(
                leading: Container(
                    // padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Hero(
                        tag: 'user2',
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2020/12/07/17/33/santa-claus-5812443_960_720.jpg',
                          height: 80.0,
                          width: 80.0,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/user.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(
                            color: const Color(0xffffffff), width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x69000000),
                              offset: Offset(0, 0),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ])),
                title: Text('User2'),
                subtitle: Text('loreum ipsum'),
                trailing: Text('4:41 pm'),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: MessageList('user2')));
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => MessageList('user2'),
                  // ));
                },
              ),
              ListTile(
                leading: Container(
                    // padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Hero(
                        tag: 'user3',
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2020/11/22/16/45/nutcracker-5767159_960_720.jpg',
                          height: 80.0,
                          width: 80.0,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/user.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(
                            color: const Color(0xffffffff), width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x69000000),
                              offset: Offset(0, 0),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ])),
                title: Text('User3'),
                subtitle: Text('loreum ipsum'),
                trailing: Text('3:41 pm'),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: MessageList('user3')));
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => MessageList('user3'),
                  // ));
                },
              ),
              ListTile(
                leading: Container(
                    // padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Hero(
                        tag: 'user4',
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2020/11/17/02/16/dog-5751151_960_720.jpg',
                          height: 80.0,
                          width: 80.0,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/user.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(
                            color: const Color(0xffffffff), width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x69000000),
                              offset: Offset(0, 0),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ])),
                title: Text('User4'),
                subtitle: Text('loreum ipsum'),
                trailing: Text('2:41 pm'),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRightWithFade,
                          child: MessageList('user4')));
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => MessageList('user4'),
                  // ));
                },
              )
            ],
            // ),
          )
        ]),
      ),
    );
  }
}
