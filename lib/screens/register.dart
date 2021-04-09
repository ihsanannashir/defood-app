import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:defood/screens/utilities/constants.dart';
import './login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  bool _success;
  String _userEmail;
  bool _showCircular = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFBD452C),
                      ),
                    ),
                    Container(
                        height: double.infinity,
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 120.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Daftar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              _fullnameInp(),
                              SizedBox(height: 5.0),
                              _usernameInp(),
                              SizedBox(height: 5.0),
                              _emailInp(),
                              SizedBox(height: 5.0),
                              _passwordInp(),
                              SizedBox(height: 10.0),
                              _registerBtn(),
                              SizedBox(height: 10.0),
                              _toLogin(),
                              _border(),
                              SizedBox(height: 20.0),
                              _altDesc(),
                              _altRegister(),
                              Container(
                                alignment: Alignment.center,
                                child: Text(_success == null
                                    ? ''
                                    : (_success
                                        ? 'Successfully registered ' +
                                            _userEmail
                                        : 'Registration failed')),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )));
  }

  Widget _usernameInp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _usernameController,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Inter',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Nama Pengguna',
              hintStyle: kHintTextStyle,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _fullnameInp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _fullnameController,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Inter',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Nama Lengkap',
              hintStyle: kHintTextStyle,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _emailInp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Inter',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Email Pengguna',
              hintStyle: kHintTextStyle,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _passwordInp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextFormField(
            controller: _passwordController,
            obscureText: _isObscure,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Inter',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.vpn_key_outlined,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                color: Color(0xFFBD452C),
              ),
              hintText: 'Kata Sandi',
              hintStyle: kHintTextStyle,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _registerBtn() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.maxFinite,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _register();
          }
        },
        padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'DAFTAR',
              style: TextStyle(
                color: Color(0xFFBD452C),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toLogin() {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text(
            'Sudah Punya Akun? Masuk',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 15.0,
            ),
          )),
    );
  }

  Widget _border() {
    return Container(
      color: Colors.white,
      child: (Row(
        children: <Widget>[
          // ...
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _altDesc() {
    return Container(
        alignment: Alignment.center,
        child: Text(
          'Atau Daftar Menggunakan',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 15.0,
          ),
        ));
  }

  Widget _altRegister() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.maxFinite,
      child: RaisedButton(
          elevation: 5.0,
          onPressed: () async {
            //..Login with google
          },
          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Ink(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png',
                      width: 20,
                      height: 20,
                    ), // <-- Use 'Image.asset(...)' here
                    SizedBox(width: 12),
                    Text(
                      'Google Account',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    debugPrint(user.email);
    Future<void> admin = _db.collection('users').doc(user.uid).set({
      'username': _usernameController.text,
      'email': user.email,
      'uid': user.uid,
      'cart': [],
      'fullname': _fullnameController.text,
    });

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
