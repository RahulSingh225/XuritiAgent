import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:groupeii_app/helper/helper_function.dart';
import 'package:groupeii_app/pages/auth/login_page.dart';
import 'package:groupeii_app/services/auth_service.dart';

import '../../widget/widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isloading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  Authservice authservice = Authservice();

  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: _isloading
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor))
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            " Create your account now to become sales wizard  ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            )),
                        Image.asset("assests/Sign up.png"),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Name",
                              prefixIcon: Icon(
                                Icons.person_add_alt_1_outlined,
                                color: Theme.of(context).primaryColor,
                              )),
                          validator: (name) {
                            // if (name!.isEmpty) {
                            //   return null;
                            // } else {
                            //   return "Name cannot be empty";
                            // }
                          },
                          onChanged: (name) {
                            setState(() {
                              fullName = name;
                              // print(pass);
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Email",
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).primaryColor,
                              )),
                          onChanged: (e) {
                            setState(() {
                              email = e;
                              // print(email);
                            });
                          },
                          // validator: (e) {
                          //   return RegExp(
                          //               // ignore: valid_regexps
                          //               "/^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*")
                          //           .hasMatch(e!)
                          //       ? null
                          //       : "Please enter a valide email";
                          // },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Password",
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                color: Theme.of(context).primaryColor,
                              )),
                          validator: (pass) {
                            if (pass!.length < 8) {
                              return "Password must be 8 charecters";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (pass) {
                            setState(() {
                              password = pass;
                              // print(pass);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: (() {
                              register();
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Already have an account?  ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (() {
                                  nextscreen(context, const LoginPage());
                                }),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ));
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });

      await authservice
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) {
        if (value == true) {
          // await HelperFunctions.saveUserLoggedInStatus(true);
          // await HelperFunctions.saveUserName(fullName);
          // await HelperFunctions.saveUserEmail(email);
        } else {
          setState(() {
            _isloading = false;
          });
        }
      });
    } else {}
  }
}
