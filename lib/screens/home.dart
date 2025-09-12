import 'package:api_test/services/userApi.dart';
import 'package:flutter/material.dart';
import 'package:api_test/models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response = await Userapi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('test API')),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  user.avatarUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.email),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(user.fullName),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("gender: ${user.gender}"),
                        Text("phone: ${user.phone}"),
                        Text("city: ${user.city}"),
                        Text("country: ${user.country}"),
                        Text("date of birth: ${user.dateOfBirth}"),
                        Text("age: ${user.age}"),
                        Text("registration date: ${user.registrationDate}"),
                        Text("registration age: ${user.registrationAge}"),
                        Text("nationality: ${user.nat}"),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
