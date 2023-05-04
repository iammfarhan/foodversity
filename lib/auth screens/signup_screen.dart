import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password, usersname;
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                const SizedBox(height: 30),
                const Text(
                  'Signup here!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: userNameTextController,
                            obscureText: false,
                            enableSuggestions: !false,
                            autocorrect: !false,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle:
                                  context.primaryTextTheme.titleSmall!.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
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
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Username is required!';
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailTextController,
                            obscureText: false,
                            enableSuggestions: !false,
                            autocorrect: !false,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: "Email",
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
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  color: context.colorScheme.error,
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required!';
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordTextController,
                            obscureText: true,
                            enableSuggestions: !true,
                            autocorrect: !true,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: "Password",
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
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
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
                              return;
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
                                signup();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        context.colorScheme.error),
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
                                "Register",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a user?",
                            style:
                                context.primaryTextTheme.titleSmall!.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            child: Text(
                              'Login here',
                              style:
                                  context.primaryTextTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.colorScheme.error,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signup() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text)
          .then(
        (value) {
          FocusScope.of(context).unfocus();
          Navigator.pushReplacementNamed(context, '/login');
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.message == 'The email address is badly formatted.') {
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
      } else if (e.message ==
          'The email address is already in use by another account.') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            elevation: 1,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
            content: Text(
              "Account already exist.",
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
              "Account already exist!",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }
    }
  }
}
