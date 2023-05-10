import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class D4uMyProfilePage extends StatefulWidget {
  D4uMyProfilePage({super.key});

  @override
  State<D4uMyProfilePage> createState() => _D4uMyProfilePageState();
}

class _D4uMyProfilePageState extends State<D4uMyProfilePage> {
  Future<void> signOut() async {
    await Auth().signOut();
    Auth().authStateChanges.listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(
          context,
          RouteName.signUp,
        );
      }
    });
  }

  List<String> title = [
    'Upload your service',
    'Shipping addresses',
    'Payment methods',
    'My reviews',
    'Settings'
  ];

  List<String> content = [
    'Service name, Service Photo',
    '3 addresses',
    'Visa **34',
    'Reviews for 4 items',
    'Notifications, password'
  ];

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      pageTitle: 'My profile',
      body: Padding(
        padding: D4uPadding.a16,
        child: Column(
          children: [
            D4uProfileAvartarTile(
              logOutFunction: signOut,
              userImage: 'assets/d4uDrone_white.jpg',
              userName: 'Matilda Brown',
              userEmail: 'matildabrown@mail.com',
            ),
            const SizedBox(
              height: 30,
            ),
            _buildProfileTile(
              'Upload your service',
              'Service name, Service Photo',
              () {
                Navigator.pushNamed(
                  context,
                  RouteName.uploadPage,
                );
              },
            ),
            _buildProfileTile(
              'Settings',
              'Notifications, password',
              () {
                Navigator.pushNamed(
                  context,
                  RouteName.settingsPage,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column _buildProfileTile(String title, String subTitle, VoidCallback onTap) {
    return Column(
      children: [
        D4uProfileTile(
          title: title,
          content: subTitle,
          onTap: onTap,
        ),
        Divider(
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
