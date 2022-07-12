import 'package:YourSawaal/componet/askquestion.dart';
import 'package:YourSawaal/componet/create.dart';
import 'package:flutter/material.dart';

class Profileview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundImage: AssetImage('images/user.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User Name',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xff035AA6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(children: [
                                  Text('Sub Content'),
                                  SizedBox(
                                    width: size.width * 0.08,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: ListView(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16),
                                              shrinkWrap: true,
                                              children: [
                                                "Share",
                                                "Invite",
                                                "Edit your credential",
                                                "Unfollow",
                                                "Mute",
                                                "Report",
                                              ]
                                                  .map(
                                                    (e) => InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12,
                                                                horizontal: 16),
                                                        child: Text(e),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.more_horiz)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.notifications_active)),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => create(
                                                      child: askquestionpage(),
                                                    )));
                                      },
                                      icon: Icon(Icons.quiz_outlined))
                                ]),
                                SizedBox(
                                  height: 20,
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  color: Color(0xff035AA6),
                                  minWidth: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'FOLLOW',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '00',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff035AA6),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '00',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff035AA6),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '00',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff035AA6),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //
                      DefaultTabController(
                          length: 3,
                          child: Column(children: [
                            TabBar(tabs: [
                              Tab(
                                child: Text(
                                  "About",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Posts",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Questions",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                          ]))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
