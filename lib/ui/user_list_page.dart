import 'package:flutter/material.dart';
import 'package:list_user_fetch/repository/user_repository.dart';
import 'package:list_user_fetch/ui/user_detail.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Danh sách'.toUpperCase(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/3d_rendering_east_asia.jpg',
              fit: BoxFit.cover,
            ),
          ),
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
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserDetail(user: user)));
                          },
                          title: Text(user.name),
                          subtitle: Text('${user.email} - ${user.address.street}'),
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
