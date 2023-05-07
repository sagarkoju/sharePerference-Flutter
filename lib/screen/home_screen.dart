import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vlogpost1/main.dart';
import 'package:vlogpost1/screen/grouplist.dart';
import 'package:vlogpost1/screen/html_screen.dart';
import 'package:vlogpost1/screen/pdfscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? logindata;
  String? username;
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata!.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                logindata!.setBool('check', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              ' welcome to ${username ?? ''}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const GroupListScreen()));
              },
              child: const Text('Grouplist Screen'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HtmlScreen()));
              },
              child: const Text('Html Screen'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PdfScreen()));
              },
              child: const Text('Pdf Screen'),
            ),
          ),
        ],
      ),
    );
  }
}
