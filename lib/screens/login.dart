import 'package:defood/screens/screencontrol.dart';
import 'package:defood/screens/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  bool _showCircular = false;
  bool _isObscure = true;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                                'Masuk',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              _emailInput(),
                              SizedBox(
                                height: 5.0,
                              ),
                              _passwordInput(),
                              SizedBox(height: 15.0),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Lupa Kata Sandi?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              _loginBtn(),
                              SizedBox(height: 20.0),
                              _toRegister(),
                              _border(),
                              SizedBox(height: 40.0),
                              _altText(),
                              _altLogin(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }

  Widget _emailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Inter',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Email Pengguna...',
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

  Widget _passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _passwordController,
            obscureText: _isObscure,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Inter',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
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
              hintText: 'Kata Sandi...',
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

  Widget _loginBtn() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.maxFinite,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _signInWithEmailAndPassword();
            openLoadingDialog(context, 'Signing In...');
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
              'MASUK',
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

  Widget _toRegister() {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {
            navigateToRegister(context);
          },
          child: Text(
            'Belum punya akun? Daftar',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 15.0,
            ),
          )),
    );
  }

  Widget _altText() {
    return Container(
        alignment: Alignment.center,
        child: Text(
          'Atau Masuk Menggunakan',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 15.0,
          ),
        ));
  }

  Widget _altLogin() {
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _showCircular = true;
        _success = true;
        _userEmail = user.email;
        debugPrint((_success).toString());
        if (_success) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ScreenControlPage()));
        }
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  Future navigateToRegister(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  openLoadingDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              content: Row(children: <Widget>[
                SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                        strokeWidth: 1,
                        valueColor: AlwaysStoppedAnimation(Color(0xFFBD452C)))),
                SizedBox(width: 10),
                Text(text, style: TextStyle(color: Color(0xFFBD452C))),
              ]),
            ));
  }
}
