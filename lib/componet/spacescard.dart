import 'package:YourSawaal/screens/spaces_screen.dart';
import 'package:flutter/material.dart';

class spacescard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ListTile(
        title: Text(
          "Group Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // CircleAvatar(
        //   radius: 20.0,
        //   backgroundColor: Colors.grey,
        // ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProfileScreen();
              },
            ),
          );
        },
      ),
      // padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      // child: Column(
      //   children: [
      //     // Row(
      //     //   children: [
      //     //     CircleAvatar(
      //     //       radius: 20.0,
      //     //       backgroundColor: Colors.grey,
      //     //     ),
      //     //     SizedBox(
      //     //       width: size.width * 0.71,
      //     //     ),
      //     //     IconButton(
      //     //         onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_rounded))
      //     //   ],
      //     // ),
      //     ListTile(
      //       title: CircleAvatar(
      //         radius: 20.0,
      //         backgroundColor: Colors.grey,
      //       ),
      //       trailing: Icon(Icons.keyboard_arrow_right),
      //       onTap: () {},
      //     )
      //   ],
      // ),
    );
  }
}
