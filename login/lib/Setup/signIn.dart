import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // variable Declaration
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input.isEmpty) {
                  return 'Please Type an Email!';
                }
              },
              onSaved: (input) {
                _email = input;
                return _email;
              },
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),

            TextFormField(
              validator: (input) {
                if(input.length < 6) {
                  return 'Your password must be atleast 6 characters!';
                }
              },
              onSaved: (input) {
                _password = input;
                return _password;
              },
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    //TODO validate Fields
    if(formState.validate()) {
      formState.save();
      
    try {
      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.push(context, MaterialPageRoute(builder: (context => Home());
      //Navigate to Home
    } catch(e) {
      print(e.message);
    }

    }

   
  }


}