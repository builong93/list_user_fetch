import 'package:flutter/material.dart';
import 'package:list_user_fetch/repository/user_repository.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    return Scaffold(
        appBar: AppBar(
          title: Text('Danh sách'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: userRepository.getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          onTap: () {},
                          title: Text(user.name),
                          subtitle: Text(user.email),
                        );
                      });
                } else {
                  return Center(
                    child: Text('Không tìm thấy dữ liệu'),
                  );
                }
              }
            }));
  }
}
