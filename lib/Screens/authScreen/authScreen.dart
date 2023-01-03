import 'package:ecomerce_app/Componets/widgets/custom_button.dart';
import 'package:ecomerce_app/Componets/widgets/custom_textFeld.dart';
import 'package:ecomerce_app/Providers/auth.dart';
import 'package:ecomerce_app/constants/globel_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  var _isLoading = false;
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final AuthProvider authProvider = AuthProvider();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authProvider.signUpUser(
        context: context,
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
          ),
          ListTile(
            tileColor: _auth == Auth.signup
                ? GlobalVariables.backgroundColor
                : GlobalVariables.greyBackgroundCOlor,
            title: Text(
              'Create Acount',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                }),
          ),
          if (_auth == Auth.signup)
            Container(
              padding: EdgeInsets.all(8),
              color: GlobalVariables.backgroundColor,
              child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: "name",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "email",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "password",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              print("data");
                              signUpUser();
                            }
                          })
                    ],
                  )),
            ),
          ListTile(
            tileColor: _auth == Auth.signin
                ? GlobalVariables.backgroundColor
                : GlobalVariables.greyBackgroundCOlor,
            title: Text(
              'Sign-In',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                }),
          ),
          if (_auth == Auth.signin)
            Container(
              padding: EdgeInsets.all(8),
              color: GlobalVariables.backgroundColor,
              child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: "email",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "password",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(text: 'Sign node In', onTap: () {})
                    ],
                  )),
            ),
        ],
      )),
    );
  }
}
