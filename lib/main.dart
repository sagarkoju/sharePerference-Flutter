import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vlogpost1/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? checkValue;

  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    getCredential();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: username,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "username",
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)))),
          CheckboxListTile(
            value: checkValue ?? false,
            onChanged: _onChanged,
            title: const Text("Remember me"),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: ListTile(
              title: const Text(
                "Login",
                textAlign: TextAlign.center,
              ),
              onTap: _navigator,
            ),
          )
        ],
      ),
    );
  }

  void _onChanged(bool? value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value!;
      sharedPreferences!.setBool("check", true);
      sharedPreferences!.setString("username", username.text);
      sharedPreferences!.setString("password", password.text);

      // getCredential();
    });
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences?.getBool("check") ?? true;
      username.text = sharedPreferences?.getString("username") ?? '';
      password.text = sharedPreferences?.getString("password") ?? '';
      // ignore: unnecessary_null_comparison
      if (checkValue == false) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        // username.clear();
        // password.clear();
        // sharedPreferences!.clear();
      }
    });
  }

  _navigator() {
    if (username.text.isNotEmpty || password.text.isNotEmpty) {
      sharedPreferences!.setBool("check", false);
      sharedPreferences!.setString("username", username.text);
      sharedPreferences!.setString("password", password.text);
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()),
      );
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return CupertinoAlertDialog(
              content: const Text(
                "username or password \ncan't be empty",
                style: TextStyle(fontSize: 16.0),
              ),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          });
    }
  }
}
