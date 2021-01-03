import 'package:flutter/material.dart';
import 'package:like_me_app/data/data.dart';
import 'package:like_me_app/widgets/custom_drawer.dart';
import 'package:like_me_app/widgets/following_users.dart';
import 'package:like_me_app/widgets/posts_carousal.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Text(
          'LIKE ME',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.pink,
            letterSpacing: 1.5,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Colors.pink,
          labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          tabs: [
            Tab(text: 'Trending'),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      drawer: CustomerDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PostsCarousal(
            pageController: _pageController,
            title: 'Posts!',
            posts: posts,
          ),
        ],
      ),
    );
  }
}

