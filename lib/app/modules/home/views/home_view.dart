import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:member_futsal/app/modules/contact/views/contact_view.dart';
import 'package:member_futsal/app/modules/dashboard/views/dashboard_view.dart';
import 'package:member_futsal/app/modules/fnb/views/fnb_view.dart';
import 'package:member_futsal/constants.dart';

import '../../../controllers/auth_controller.dart';
import '../../login/views/login_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_active_rounded,
                  color: kDefaultColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  AuthController().signOut().then(
                        (_) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                        ),
                      );
                },
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: kDefaultColor,
                ),
              ),
            ],
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text('Hi, Welcome!'),
                ],
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black87,
              indicatorColor: kDefaultColor,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: 'Member',
                ),
                Tab(
                  text: 'FnB',
                ),
                Tab(
                  text: 'Contact',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DashboardView(),
              FnbView(),
              ContactView(),
            ],
          ),
        ),
      );
}
