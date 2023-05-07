// // share preference on login page ?

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:vlogpost1/screen/home_screen.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();

//   bool checkValue = false;

//   SharedPreferences? sharedPreferences;
//   String? usernames;

//   @override
//   void initState() {
//     super.initState();
//     getCredential();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: _body(),
//       ),
//     );
//   }

//   Widget _body() {
//     return Container(
//       padding: const EdgeInsets.only(right: 20.0, left: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           const SizedBox(
//             height: 20,
//           ),
//           TextField(
//             controller: username,
//             decoration: InputDecoration(
//                 border: const OutlineInputBorder(),
//                 hintText: "username",
//                 hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3))),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextField(
//               controller: password,
//               obscureText: true,
//               decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: "password",
//                   hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)))),
//           CheckboxListTile(
//             value: checkValue,
//             onChanged: _onChanged,
//             title: const Text("Remember me"),
//             controlAffinity: ListTileControlAffinity.leading,
//           ),
//           Container(
//             decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//             child: ListTile(
//               title: const Text(
//                 "Login",
//                 textAlign: TextAlign.center,
//               ),
//               onTap: _navigator,
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _onChanged(bool? value) async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {
//       checkValue = value!;
//       sharedPreferences!.setBool("check", checkValue);
//       sharedPreferences!.setString("username", username.text);
//       sharedPreferences!.setString("password", password.text);

//       getCredential();
//     });
//   }

//   getCredential() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {
//       checkValue = sharedPreferences?.getBool("check") ?? true;
//       // ignore: unnecessary_null_comparison
//       if (checkValue != null) {
//         if (checkValue) {
//           username.text = sharedPreferences?.getString("username") ?? '';
//           password.text = sharedPreferences?.getString("password") ?? '';
//         } else {
//           username.clear();
//           password.clear();
//           sharedPreferences!.clear();
//         }
//       } else {
//         checkValue = false;
//       }
//     });
//   }

//   _navigator() {
//     if (username.text.isNotEmpty || password.text.isNotEmpty) {
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
//           (Route<dynamic> route) => false);
//     } else {
//       showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) {
//             return CupertinoAlertDialog(
//               content: const Text(
//                 "username or password \ncan't be empty",
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               actions: <Widget>[
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("OK"))
//               ],
//             );
//           });
//     }
//   }
// }
