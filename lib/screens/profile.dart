import 'package:YourSawaal/componet/my_clipper.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined))
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              // color: Colors.amber,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.yellow,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 125),
                width: 140,
                height: 140,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/user.png")),
                    ),
                  ),
                  Positioned(
                      bottom: 6,
                      right: 6,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          color: Colors.red,
                        ),
                        child: FlatButton(
                          padding: EdgeInsets.only(),
                          onPressed: () {},
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      )),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 130),
                  child: Text(
                    "User Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 280, horizontal: 150),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(300, 30),
                    textStyle: TextStyle(fontSize: 15),
                    primary: Colors.blueAccent,
                    side: BorderSide(width: 1.5, color: Colors.red),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.red),
                    ))),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                margin: EdgeInsets.only(top: 330),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "00",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ]),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 150),
              child: Container(
                margin: EdgeInsets.only(top: 360),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "00",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ]),
              )),
          Positioned(
              height: 745,
              child: Container(
                margin: EdgeInsets.only(left: 280),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "00",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ]),
              )),
        ],
      ),
    );
  }
}
