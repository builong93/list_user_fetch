import 'package:flutter/material.dart';
import 'package:list_user_fetch/model/user.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết về ${user.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text(user.name),
              subtitle: Text(user.email),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("s")
              ],
            )
          ],
        )),
      ),
    );
  }
}
