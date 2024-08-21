import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Information"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF45C47C),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 45.0,
                backgroundImage: AssetImage('assets/images/user.jpg'),
                backgroundColor: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileItem(
                      icon: Icons.person,
                      label: 'Username',
                      value: 'John Doe',
                    ),
                    Divider(),
                    _buildProfileItem(
                      icon: Icons.mail,
                      label: 'Email',
                      value: 'johndoe@gmail.com',
                    ),
                    Divider(),
                    _buildProfileItem(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: '9898712132',
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildProfileItem({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Container(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      children: [
        Icon(
          icon,
          color: Color(0xFF45C47C),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
