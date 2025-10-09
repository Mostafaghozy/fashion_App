// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInDemo extends StatefulWidget {
//   const GoogleSignInDemo({super.key});

//   @override
//   State<GoogleSignInDemo> createState() => _GoogleSignInDemoState();
// }

// class _GoogleSignInDemoState extends State<GoogleSignInDemo> {
//   GoogleSignInAccount? _user;

//   Future<void> _handleSignIn() async {
//     try {
//       final account = await GoogleSignIn.instance.authenticate(); // الجديد
//       setState(() => _user = account);
//     } catch (e) {
//       print("Error during sign in: $e");
//     }
//   }

//   Future<void> _handleSignOut() async {
//     try {
//       await GoogleSignIn.instance.disconnect(); // الجديد
//       setState(() => _user = null);
//     } catch (e) {
//       print("Error during sign out: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Google Sign In")),
//       body: Center(
//         child: _user == null
//             ? ElevatedButton(
//                 onPressed: _handleSignIn,
//                 child: const Text("Sign in with Google"),
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: NetworkImage(_user!.photoUrl ?? ""),
//                     radius: 30,
//                   ),
//                   const SizedBox(height: 12),
//                   Text("Hello, ${_user!.displayName}"),
//                   Text(_user!.email),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _handleSignOut,
//                     child: const Text("Sign out"),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
