import 'package:flutter/material.dart';

class sidebar extends StatelessWidget {
  const sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: [
      UserAccountsDrawerHeader(
      accountName: const Text('venkat'),
      accountEmail: const Text('venkat.innojc@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: Image.asset(
          'asserts/fb.jpg',
          fit: BoxFit.cover,
          width: 90,
          height: 90,
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage('asserts/login.png')),
      ),
    ),
    const ListTile(
    leading: Icon(Icons.favorite),
    title: Text('Favorites'),
    )onTap: () => null,
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('Friends'),
    )onTap: () => null,
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('share'),
    )onTap: () => null,
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('request'),
    )onTap: () => null,
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('settings'),
    )onTap: () => null,
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('policies'),
    )onTap: () => null,
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('Exit'),
    )onTap: () => null,
    ),
    ],
    ),
    );
  }
}