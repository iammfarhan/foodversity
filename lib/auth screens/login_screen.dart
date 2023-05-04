import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
              SizedBox(height: 30),
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Please sign in to continue",
                style: context.primaryTextTheme.titleMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailTextController,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: !false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle:
                                context.primaryTextTheme.titleSmall!.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: context.colorScheme.primary,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color: context.colorScheme.error,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                errors.contains('kEmailNullError')) {
                              removeError(error: 'kEmailNullError');
                            } else if (value.isNotEmpty) {
                              addError(error: 'kInvalidEmailError');
                              return null;
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: 'kEmailNullError');
                              removeError(error: 'kInvalidEmailError');
                              return 'Email is required!';
                            } else if (value.isNotEmpty) {
                              addError(error: 'kInvalidEmailError');
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: const TextStyle(fontSize: 14),
                          controller: passwordTextController,
                          obscureText: true,
                          enableSuggestions: !true,
                          autocorrect: !true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle:
                                context.primaryTextTheme.titleSmall!.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: context.colorScheme.primary,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color: context.colorScheme.error,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                errors.contains('kPassNullError')) {
                              removeError(error: 'kPassNullError');
                            } else if (value.length >= 6) {
                              removeError(error: 'kShortPassError');
                            } else if (value.length < 6 && value.isNotEmpty) {
                              addError(error: 'kShortPassError');
                            }
                            return null;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: 'kPassNullError');
                              removeError(error: 'kShortPassError');
                              return 'Password is required!';
                            } else if (value.length < 6 && value.isNotEmpty) {
                              addError(error: 'kShortPassError');
                              return 'Password must be 6 or > 6 digits.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signin();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                context.colorScheme.error,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(
                                    color: context.colorScheme.error,
                                  ),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Not a Member yet?",
                        style: context.primaryTextTheme.titleSmall!.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        child: Text(
                          'Signup here',
                          style: context.primaryTextTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.error,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                      ),
                    ]),
                    const SizedBox(height: 10),
                    Center(
                      child: GestureDetector(
                        child: Text(
                          'Forgot Password?',
                          style: context.primaryTextTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.error,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/reset');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text)
          .then((value) => Navigator.pushReplacementNamed(context, '/home'));
    } on FirebaseAuthException catch (e) {
      if (e.message ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            elevation: 1,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
            content: Text(
              "No record found.",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 5),
          ),
        );
      } else if (e.message == 'The email address is badly formatted.') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            elevation: 1,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
            content: Text(
              "Invalid E-mail Format.",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 5),
          ),
        );
      } else if (e.message == 'Given String is empty or null.') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            elevation: 1,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
            content: Text(
              "Invalid e-mail Format.",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 5),
          ),
        );
      } else if (e.message ==
          'The password is invalid or the user does not have a password.') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            elevation: 1,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
            content: Text(
              "Invalid password.",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }
      print(e.toString());
    }
  }
}
