import 'package:flutter/material.dart';
import 'package:like_me_app/data/data.dart';
import 'package:like_me_app/screens/home_screen.dart';
import 'package:like_me_app/screens/login_screen.dart';

class CustomerDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(
                  currentUser.backgroundImageUrl,
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: Colors.pink),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          letterSpacing: 1.5),
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard, color: Colors.pink),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
              Icon(
                Icons.chat,
                color: Colors.pink,
              ),
              'Chat',
              () {}),
          _buildDrawerOption(
              Icon(Icons.location_on, color: Colors.pink), 'Map', () {}),
          _buildDrawerOption(Icon(Icons.account_circle, color: Colors.pink),
              'Your Profile', () {}),
          _buildDrawerOption(
              Icon(Icons.settings, color: Colors.pink), 'Setting', () {}),

          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.directions_run, color: Colors.pink),
                'Logout',
                    () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
