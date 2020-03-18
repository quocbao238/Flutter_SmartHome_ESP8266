import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smarthome/models/info.dart';
import "package:http/http.dart" as http;

class AuthFireBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();

      if (account == null) return false;
      AuthResult res =
          await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if (res.user != null) {
        Info.fbuser = await _auth.currentUser();
        Info.googleSignIn = googleSignIn;
        Info.googleSignInAccount = account;
        return true;
      } else {
        // print("Google signIn fail");
        return false;
      }
    } catch (e) {
      print(e.message);
      print("Error logging with google");
      return false;
    }
  }

  Future<bool> handleGetContact() async {
    try {
      print("Loading contact info...");
      // });
      final http.Response response = await http.get(
        'https://people.googleapis.com/v1/people/me/connections'
        '?requestMask.includeField=person.names',
        headers: await Info.googleSignInAccount.authHeaders,
      );
      if (response.statusCode != 200) {
        // setState(() {
        print("People API gave a ${response.statusCode} "
            "response. Check logs for details.");
        // });
        print('People API ${response.statusCode} response: ${response.body}');
        return true;
      }
      final Map<String, dynamic> data = json.decode(response.body);
      Info.namedContact = _pickFirstNamedContact(data);
      if (Info.namedContact != null) {
        print("I see you know ${Info.namedContact}!");
      } else {
        print("No contacts to display.");
      }
    } catch (e) {
      print(e.message);
      return false;
    }
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }
}
