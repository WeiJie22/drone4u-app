import 'package:drone4u/components/d4u_centered_loading.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/user.dart';
import 'package:drone4u/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class D4uMyProfilePage extends StatefulWidget {
  const D4uMyProfilePage({super.key});

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
        child: ChangeNotifierProvider(
          create: (context) => SettingProvider(),
          builder: (context, child) {
            SettingProvider model = Provider.of<SettingProvider>(context);
            SingleUser user = model.user ?? SingleUser();

            if (model.isLoading) {
              return const D4uCenteredLoading();
            }

            return Column(
              children: [
                D4uProfileAvartarTile(
                  logOutFunction: signOut,
                  userImage: 'assets/d4uDrone_white.jpg',
                  userName: '${user.name}',
                  userEmail: '${user.email}',
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildProfileTile(
                  title: 'Upload your service',
                  subTitle: 'Service name, Service Photo',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.uploadPage,
                    );
                  },
                ),
                _buildProfileTile(
                  title: 'Your Products',
                  subTitle: 'Mange your products',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.manageProductPage,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _buildProfileTile(
      {String? title, String? subTitle, VoidCallback? onTap}) {
    return Column(
      children: [
        D4uProfileTile(
          title: title ?? "",
          content: subTitle ?? "",
          onTap: onTap ?? () {},
        ),
        Divider(
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
