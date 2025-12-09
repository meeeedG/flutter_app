import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/pages/Contact/contact_page.dart';
import 'package:github_api_flutter_app/pages/Posts/posts_page.dart';
import 'package:github_api_flutter_app/pages/Users/users_page.dart';
import 'package:github_api_flutter_app/pages/meteo/meteo_page.dart';
import 'package:github_api_flutter_app/pages/Chatbot/chatbot_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Mohamed Ghalib"),
                accountEmail: const Text("mohamedghalib157@gmail.com"),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("images/profile.png"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.supervised_user_circle_outlined),
                title: const Text('Users'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const UsersPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.post_add),
                title: const Text('Posts'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PostsPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.wb_sunny),
                title: const Text('Météo'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MeteoPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ContactPages()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text('ChatBot'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: const MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Welcome to the Home page!')));
  }
}
